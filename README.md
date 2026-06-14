# My Homelab

A comprehensive, automated, and resource-optimized Docker-based infrastructure for personal hosting and self-management.

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue.svg" />
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED.svg" />
  <img src="https://img.shields.io/badge/Make-Automated-4479A1.svg" />
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/badge/license-MIT-yellow.svg" target="_blank" />
  </a>
</p>

## Description

My Homelab provides a robust, centralized environment for running 30 self-hosted applications and services. Built entirely on Docker and orchestrated through a unified Makefile, this project simplifies the deployment, management, and monitoring of diverse applications ranging from personal finance and productivity to networking and artificial intelligence. It solves the complexity of managing multiple independent services by providing a standardized configuration approach, strict resource management, and isolated networking, making it ideal for self-hosters and developers running personal cloud infrastructure.

## Features

- **Centralized Orchestration** - Manage all 30 services through a single, intuitive Makefile command interface
- **Resource Optimization** - Pre-configured CPU and memory limitations for every container to ensure host stability
- **Unified Configuration** - Manage all environment variables, ports, and credentials from a single `.env` file
- **Network Isolation** - Dedicated internal Docker network ensuring secure and seamless inter-container communication
- **Security First** - Built-in network binding controls to easily restrict service access to local interfaces
- **Scalable Architecture** - Modular folder structure making it simple to add, remove, or modify individual services

## Tech Stack

- **Containerization**: Docker, Docker Compose
- **Automation**: GNU Make
- **Databases**: PostgreSQL, MariaDB, MongoDB, Redis
- **Reverse Proxy / Dashboard**: Homepage

## Installation

### Prerequisites

- Docker Engine (v24+)
- Docker Compose (v2+)
- GNU Make

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

3. Configure your environment variables (see Configuration section)
4. Initialize the internal Docker network

```bash
make network
```

5. Start the complete infrastructure

```bash
make start-all
```

## Configuration

The entire infrastructure is configured via the central `.env` file. 

### Security and Networking

| Variable | Description | Example |
|----------|-------------|---------|
| `TZ` | System timezone for all containers | `Asia/Jakarta` |
| `BIND_IP` | Network binding interface (`127.0.0.1` for local, `0.0.0.0` for public) | `0.0.0.0` |

### Resource Limits

Every service has dedicated resource limits to prevent any single application from consuming all host resources. Examples:

| Variable | Description | Default |
|----------|-------------|---------|
| `OLLAMA_CPU_LIMIT` | CPU cores allocated to Ollama | `4` |
| `OLLAMA_MEMORY_LIMIT` | RAM allocated to Ollama | `8G` |
| `PORTAINER_CPU_LIMIT` | CPU cores allocated to Portainer | `0.5` |
| `PORTAINER_MEMORY_LIMIT` | RAM allocated to Portainer | `256M` |

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

You can manage any of the 30 services individually. Replace `<service>` with the service name (e.g., `mariadb`, `portainer`, `n8n`).

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
├── Makefile                  # Core automation and management script
└── docker/                   # Individual service definitions
    ├── actual-budget/        # Personal finance manager
    ├── adguard-home/         # Network-wide ad blocking
    ├── bento-pdf/            # PDF manipulation
    ├── beszel/               # System monitoring hub
    ├── bugsink/              # Error tracking
    ├── changedetection/      # Website change monitoring
    ├── excalidraw/           # Collaborative whiteboard
    ├── flaresolverr/         # Cloudflare challenge solver
    ├── grafana/              # Data visualization
    ├── homepage/             # Application dashboard
    ├── it-tools/             # Developer utility suite
    ├── listmonk/             # Newsletter and mailing list manager
    ├── mariadb/              # Relational database
    ├── mongodb/              # NoSQL database
    ├── n8n/                  # Workflow automation
    ├── ollama/               # Local large language models
    ├── open-webui/           # Interface for Ollama
    ├── openspeedtest/        # Network speed testing
    ├── portainer/            # Container management interface
    ├── postgres/             # Relational database
    ├── redis/                # In-memory data store
    ├── ryot/                 # Media tracking
    ├── serpbear/             # Search engine rank tracking
    ├── smokeping/            # Network latency monitoring
    ├── socks5/               # Proxy server
    ├── stirling-pdf/         # Advanced PDF manipulation
    ├── uptime-kuma/          # Uptime monitoring
    ├── wallos/               # Subscription tracker
    ├── wealthfolio/          # Investment tracking
    └── wordpress/            # Content management system and blog
```

## Scripts / Commands

The `Makefile` exposes the following primary service targets:

`actual-budget`, `adguard-home`, `bento-pdf`, `beszel`, `bugsink`, `changedetection`, `excalidraw`, `flaresolverr`, `grafana`, `homepage`, `it-tools`, `listmonk`, `mariadb`, `mongodb`, `n8n`, `ollama`, `open-webui`, `openspeedtest`, `portainer`, `postgres`, `redis`, `ryot`, `serpbear`, `smokeping`, `socks5`, `stirling-pdf`, `uptime-kuma`, `wallos`, `wealthfolio`, `wordpress`

## Contributing

Contributions to improve the infrastructure setup or add new services are welcome.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-service`)
3. Ensure you add corresponding Makefile targets and `.env.example` entries
4. Commit your changes (`git commit -m 'Add new service'`)
5. Push to the branch (`git push origin feature/new-service`)
6. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for detailed terms and conditions.

## Author

Reynaldi Arya
