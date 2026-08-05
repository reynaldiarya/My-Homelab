# My Homelab

A self-hosted Docker infrastructure with Traefik reverse proxy, automatic HTTPS via Cloudflare Origin Certificate, and dual-access routing (public domain + local LAN).

<p align="center">
  <img src="https://img.shields.io/badge/version-1.1.0-blue.svg" />
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED.svg" />
  <img src="https://img.shields.io/badge/Traefik-v3-orange.svg" />
  <img src="https://img.shields.io/badge/Make-Automated-4479A1.svg" />
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/badge/license-MIT-yellow.svg" target="_blank" />
  </a>
</p>

## Description

My Homelab provides a robust, centralized environment for running 36 self-hosted applications. All services are routed through **Traefik v3** as a reverse proxy with **HTTPS enforced** on every route using **Cloudflare Origin Certificate**. Services are accessible both via public domain (through Cloudflare Tunnel) and local domain (through AdGuard Home DNS on LAN) — without exposing any direct ports to the internet.

## Features

- **Traefik v3 Reverse Proxy** — All services accessible via HTTPS subdomain, no direct port exposure
- **Cloudflare Origin Certificate** — Valid 15-year TLS cert, no Let's Encrypt rate limits or API tokens required
- **Dual-Access Routing** — Every service accessible via `service.yourdomain.com` (internet) AND `service.local` (LAN)
- **Cloudflare Tunnel** — No port forwarding required on your router; IP never exposed to the internet
- **AdGuard Home DNS** — Local DNS rewrites so all `*.local` subdomains resolve to the server on LAN
- **Resource Limits** — CPU and memory limits on every container to prevent host instability
- **Healthchecks** — Database services (PostgreSQL, MariaDB, Redis, MongoDB) have healthchecks for proper dependency management
- **Security Hardened** — HSTS, XSS protection, referrer policy, no-new-privileges, read-only docker socket mounts
- **Internal-Only Services** — Sensitive services (AdGuard, InfluxDB, Netdata, Ollama, Smokeping, FlareSolverr) restricted to LAN via IP allowlist

## Tech Stack

- **Containerization**: Docker, Docker Compose
- **Reverse Proxy**: Traefik v3
- **TLS**: Cloudflare Origin Certificate (wildcard `*.yourdomain.com`)
- **Tunnel**: Cloudflare Tunnel (`cloudflared`)
- **Local DNS**: AdGuard Home
- **Automation**: GNU Make
- **Databases**: PostgreSQL, MariaDB, MongoDB, Redis

## Architecture

```text
[ Browser / Internet ]
         │
         ▼
[ Cloudflare Edge — HTTPS ]
         │
         ▼ (Cloudflare Tunnel)
[ cloudflared (on server) ]
         │
         ▼
[ Traefik v3 :443 ] ──── reads Host header ────►  Container A, B, C...
         │
         └── also listens for *.local (LAN direct)
```

## Installation

### Prerequisites

- Docker Engine (v24+)
- Docker Compose (v2+)
- GNU Make
- A domain managed by Cloudflare
- Cloudflare Tunnel set up (`cloudflared`)

### Steps

1. Clone the repository to your server

```bash
git clone https://github.com/reynaldiarya/My-Homelab.git
cd My-Homelab
```

2. Copy the environment configuration template

```bash
cp .env.example .env
```

3. Configure your environment variables (see [Configuration](#configuration))

4. Place your Cloudflare Origin Certificate files:
   - `docker/traefik/certs/cert.pem` — Origin Certificate
   - `docker/traefik/certs/key.pem` — Private Key

   > Generate at: Cloudflare Dashboard → SSL/TLS → Origin Server → Create Certificate (select `*.yourdomain.com`, validity 15 years)

5. Initialize the internal Docker network

```bash
make network
```

6. Start Traefik first, then all services

```bash
make start-traefik
make start-all
```

## Configuration

All configuration is managed via the central `.env` file.

### Traefik & Domain

| Variable | Description | Example |
|----------|-------------|---------|
| `TZ` | Timezone for all containers | `Asia/Jakarta` |
| `TRAEFIK_DOMAIN` | Your public domain | `yourdomain.com` |
| `LOCAL_DOMAIN` | Your local LAN domain suffix | `local` |
| `TRAEFIK_DASHBOARD_AUTH` | Basic auth for Traefik dashboard (htpasswd format, escape `$` as `$$`) | `admin:$$2y$$...` |

### Generating Traefik Dashboard Password

```bash
# Run on your server, then copy output to TRAEFIK_DASHBOARD_AUTH in .env
htpasswd -nbB admin your_secure_password | sed 's/\$/\$\$/g'
```

### Resource Limits

Every service has dedicated CPU and memory limits. Examples:

| Variable | Default |
|----------|---------|
| `OLLAMA_CPU_LIMIT` | `4` |
| `OLLAMA_MEMORY_LIMIT` | `8G` |
| `PORTAINER_CPU_LIMIT` | `0.5` |
| `PORTAINER_MEMORY_LIMIT` | `256M` |

### Database Ports (localhost-bound only)

| Variable | Default | Service |
|----------|---------|---------|
| `POSTGRES_PORT` | `5432` | PostgreSQL |
| `MARIADB_PORT` | `3306` | MariaDB |
| `MONGODB_PORT` | `27017` | MongoDB |
| `REDIS_PORT` | `6379` | Redis |

## Accessing Services

### Via Internet (Cloudflare Tunnel)

Configure each subdomain in Cloudflare Zero Trust → Tunnels:

| Field | Value |
|-------|-------|
| Service Type | `HTTPS` |
| URL | `localhost:443` |
| TLS → No TLS Verify | `Enabled` |

All subdomains point to the same `localhost:443` — Traefik routes based on `Host` header automatically.

### Via LAN (AdGuard Home DNS)

In AdGuard Home → Filters → DNS Rewrites, add:

| Domain | Answer |
|--------|--------|
| `*.local` | `192.168.1.X` (your server IP) |

Then access services at `https://portainer.local`, `https://nextcloud.local`, etc.

> **Note**: Browser will show an SSL warning for `.local` domains since the Cloudflare Origin Certificate is issued for `*.yourdomain.com`. Click Advanced → Accept Risk, or install the Cloudflare CA certificate on your devices.

## Usage

Management is handled entirely through the included Makefile.

### General Commands

```bash
# View all available commands
make help

# Create the required Docker network
make network

# Start, stop, or update the entire stack
make start-all
make stop-all
make update-all
```

### Individual Service Management

Replace `<service>` with the service folder name (e.g., `portainer`, `nextcloud`, `n8n`).

```bash
# Start a specific service
make start-<service>

# Stop a specific service
make stop-<service>

# Pull latest images and update a specific service
make update-<service>

# View real-time logs for a specific service
make logs-<service>
```

## Project Structure

```text
/
├── .env.example              # Central configuration template
├── .env                      # Your local configuration (not committed)
├── Makefile                  # Automation and management script
└── docker/
    ├── traefik/              # Reverse proxy + TLS termination
    │   ├── certs/            # Place cert.pem and key.pem here
    │   ├── config/
    │   │   ├── traefik.yml   # Traefik static config
    │   │   └── dynamic/
    │   │       ├── middlewares.yml  # Security headers, IP allowlists
    │   │       └── tls.yml          # TLS options and certificate config
    │   └── docker-compose.yml
    ├── actual-budget/        # Personal finance manager
    ├── adguard-home/         # Network-wide ad blocking + local DNS
    ├── bento-pdf/            # PDF manipulation
    ├── beszel/               # System monitoring hub
    ├── blesta/               # Billing and client management
    ├── bugsink/              # Error tracking
    ├── changedetection/      # Website change monitoring
    ├── excalidraw/           # Collaborative whiteboard
    ├── flaresolverr/         # Cloudflare challenge solver (internal)
    ├── grafana/              # Data visualization
    ├── homepage/             # Application dashboard
    ├── influxdb/             # Time-series database (internal)
    ├── it-tools/             # Developer utility suite
    ├── listmonk/             # Newsletter and mailing list manager
    ├── mariadb/              # Relational database (localhost only)
    ├── mongodb/              # NoSQL database (localhost only)
    ├── n8n/                  # Workflow automation
    ├── netdata/              # Real-time performance monitoring (internal)
    ├── nextcloud/            # Cloud collaboration and storage
    ├── ollama/               # Local large language models (internal)
    ├── onlyoffice/           # Document editing server
    ├── open-webui/           # Web interface for Ollama
    ├── openspeedtest/        # Network speed testing
    ├── portainer/            # Container management interface
    ├── postgres/             # Relational database (localhost only)
    ├── redis/                # In-memory cache (localhost only)
    ├── ryot/                 # Media tracking
    ├── serpbear/             # Search engine rank tracking
    ├── smokeping/            # Network latency monitoring (internal)
    ├── socks5/               # SOCKS5 proxy server
    ├── stirling-pdf/         # Advanced PDF processing
    ├── uptime-kuma/          # Uptime monitoring
    ├── wallos/               # Subscription tracker
    ├── wealthfolio/          # Investment tracking
    └── wordpress/            # CMS and blog platform
```

## Security Notes

- **Databases** (PostgreSQL, MariaDB, MongoDB, Redis) are bound to `127.0.0.1` only — never exposed to the network
- **Internal services** (Netdata, InfluxDB, Ollama, AdGuard, Smokeping, FlareSolverr) are restricted to LAN IPs via Traefik IP allowlist middleware
- **Traefik dashboard** is protected with Basic Auth (bcrypt)
- **docker.sock** is mounted read-only (`:ro`) on all services that need it
- **No ports** are directly exposed to the internet — all traffic goes through Cloudflare Tunnel

## Scripts / Commands

The `Makefile` exposes the following primary service targets:

`actual-budget`, `adguard-home`, `bento-pdf`, `beszel`, `blesta`, `bugsink`, `changedetection`, `excalidraw`, `flaresolverr`, `grafana`, `homepage`, `influxdb`, `it-tools`, `listmonk`, `mariadb`, `mongodb`, `n8n`, `netdata`, `nextcloud`, `ollama`, `onlyoffice`, `open-webui`, `openspeedtest`, `portainer`, `postgres`, `redis`, `ryot`, `serpbear`, `smokeping`, `socks5`, `stirling-pdf`, `traefik`, `uptime-kuma`, `wallos`, `wealthfolio`, `wordpress`

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-service`)
3. Add the service folder under `docker/` with a `docker-compose.yml`
4. Add Traefik labels (public + local router pattern)
5. Add corresponding Makefile targets and `.env.example` entries
6. Commit and open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Reynaldi Arya
