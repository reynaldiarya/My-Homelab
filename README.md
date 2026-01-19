# 🏠 My Homelab

A curated collection of Docker Compose configurations for my personal homelab. This repository contains various self-hosted services that are organized and ready to deploy.

## ✨ Features

- 🧰 **Plug & Play** — Minimal setup, just clone and run
- 📁 **Organized** — Each service in its own folder
- 🔧 **Customizable** — Easy to modify according to your needs
- 🔐 **Secure** — Uses environment variables for credentials
- 📊 **Resource Control** — Dynamic CPU & memory limits per service
- 🛠️ **Makefile** — Easy commands to manage all services

## 📦 Services

### Databases

| Service                          | Port  | Description                            |
| -------------------------------- | ----- | -------------------------------------- |
| [MariaDB](./docker/mariadb/)     | 3306  | Relational database (MySQL compatible) |
| [PostgreSQL](./docker/postgres/) | 5432  | Advanced relational database           |
| [Redis](./docker/redis/)         | 6379  | In-memory cache & message broker       |
| [MongoDB](./docker/mongodb/)     | 27017 | NoSQL document database                |

### Management & Monitoring

| Service                          | Port | Description          |
| -------------------------------- | ---- | -------------------- |
| [Portainer](./docker/portainer/) | 9443 | Docker management UI |

### Automation

| Service              | Port | Description                  |
| -------------------- | ---- | ---------------------------- |
| [N8N](./docker/n8n/) | 5678 | Workflow automation platform |

### Finance

| Service                                  | Port | Description              |
| ---------------------------------------- | ---- | ------------------------ |
| [Actual Budget](./docker/actual-budget/) | 5006 | Personal finance manager |
| [Wallos](./docker/wallos/)               | 8282 | Subscription tracker     |

### Tools & Utilities

| Service                                      | Port | Description               |
| -------------------------------------------- | ---- | ------------------------- |
| [SerpBear](./docker/serpbear/)               | 3000 | SEO rank tracking         |
| [ChangeDetection](./docker/changedetection/) | 5000 | Website change monitoring |
| [Stirling PDF](./docker/stirling-pdf/)       | 8088 | PDF toolkit               |

## 🚀 Quick Start

### 1. Install Docker & Docker Compose

Make sure Docker is installed on your system:
👉 [Download Docker](https://www.docker.com/get-docker)

Verify installation:

```bash
docker -v
docker compose version
```

### 2. Clone Repository

```bash
git clone https://github.com/reynaldiarya/My-Homelab.git
cd My-Homelab
```

### 3. Setup Environment Variables

```bash
cp .env.example .env
# Edit .env with your secure passwords
```

### 4. Run Services

Using Makefile (recommended):

```bash
# Show all available commands
make help

# Start all services
make start-all

# Start individual service
make start-mariadb
make start-portainer
```

Or manually:

```bash
# Create network first
docker network create homelab

# Run a service
docker compose -f docker/mariadb/docker-compose.yml up -d
```

## 📁 Folder Structure

```
My-Homelab/
├── docker/
│   ├── actual-budget/
│   ├── changedetection/
│   ├── mariadb/
│   ├── mongodb/
│   ├── n8n/
│   ├── portainer/
│   ├── postgres/
│   ├── redis/
│   ├── serpbear/
│   ├── stirling-pdf/
│   └── wallos/
├── .env.example
├── .gitignore
├── Makefile
└── README.md
```

## 🛠️ Makefile Commands

| Command                 | Description               |
| ----------------------- | ------------------------- |
| `make help`             | Show all commands         |
| `make network`          | Create homelab network    |
| `make start-all`        | Start all services        |
| `make stop-all`         | Stop all services         |
| `make update-all`       | Update all services       |
| `make start-<service>`  | Start a specific service  |
| `make stop-<service>`   | Stop a specific service   |
| `make update-<service>` | Update a specific service |
| `make logs-<service>`   | View service logs         |

**Available services:** `mariadb`, `postgres`, `redis`, `mongodb`, `portainer`, `n8n`, `actual-budget`, `serpbear`, `changedetection`, `wallos`, `stirling-pdf`

### Examples

```bash
# Start MariaDB
make start-mariadb

# View Portainer logs
make logs-portainer

# Update all services to latest version
make update-all

# Stop N8N
make stop-n8n
```

## ⚙️ Resource Limits

Each service supports dynamic resource limits via environment variables:

```env
# Example in .env
MARIADB_CPU_LIMIT=2
MARIADB_MEMORY_LIMIT=2G
```

### Default Resource Limits

| Service            | CPU | Memory |
| ------------------ | --- | ------ |
| MariaDB            | 1   | 1G     |
| PostgreSQL         | 1   | 1G     |
| Redis              | 0.5 | 512M   |
| MongoDB            | 1   | 1G     |
| Portainer          | 0.5 | 256M   |
| N8N                | 1   | 1G     |
| Actual Budget      | 0.5 | 256M   |
| SerpBear           | 0.5 | 512M   |
| ChangeDetection    | 0.5 | 512M   |
| Sockpuppet Browser | 1   | 1G     |
| Wallos             | 0.5 | 256M   |
| Stirling PDF       | 1   | 512M   |

## 🔐 Security

- Never commit `.env` file to the repository
- Use strong passwords for all services
- Consider using Docker secrets for production
- All sensitive data is stored in `.env` file which is gitignored

## 📝 Notes

- All services use the `homelab` network for inter-container communication
- Data is stored in `./data` folder within each service directory (gitignored)
- Default ports can be changed via environment variables
- Global timezone is configured via `TZ` variable in `.env`

## 📄 License

MIT License - Free to use and modify
