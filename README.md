# 🏠 My Homelab

A curated collection of Docker Compose configurations for my personal homelab. This repository contains various self-hosted services that are organized and ready to deploy.

## ✨ Features

- 🧰 **Plug & Play** — Minimal setup, just clone and run
- 📁 **Organized** — Each service in its own folder
- 🔧 **Customizable** — Easy to modify according to your needs
- 🔐 **Secure** — Uses environment variables for credentials
- 📊 **Resource Control** — Dynamic CPU & memory limits per service

## 📦 Services

| Service                                  | Port  | Description                            |
| ---------------------------------------- | ----- | -------------------------------------- |
| [MariaDB](./docker/mariadb/)             | 3306  | Relational database (MySQL compatible) |
| [PostgreSQL](./docker/postgres/)         | 5432  | Advanced relational database           |
| [Redis](./docker/redis/)                 | 6379  | In-memory cache & message broker       |
| [MongoDB](./docker/mongodb/)             | 27017 | NoSQL document database                |
| [Portainer](./docker/portainer/)         | 9443  | Docker management UI                   |
| [N8N](./docker/n8n/)                     | 5678  | Workflow automation platform           |
| [Actual Budget](./docker/actual-budget/) | 5006  | Personal finance manager               |

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

### 4. Create Network

```bash
docker network create homelab
```

### 5. Run a Service

Navigate to the service folder and run:

```bash
# Example: Running MariaDB
cd docker/mariadb
docker compose up -d

# Example: Running Portainer
cd docker/portainer
docker compose up -d
```

## 📁 Folder Structure

```
My-Homelab/
├── docker/
│   ├── actual-budget/
│   ├── mariadb/
│   ├── mongodb/
│   ├── n8n/
│   ├── portainer/
│   ├── postgres/
│   └── redis/
├── .env.example
├── .gitignore
└── README.md
```

## ⚙️ Resource Limits

Each service supports dynamic resource limits via environment variables:

```env
# Example in .env
MARIADB_CPU_LIMIT=2
MARIADB_MEMORY_LIMIT=2G
```

### Default Resource Limits

| Service       | CPU | Memory |
| ------------- | --- | ------ |
| MariaDB       | 1   | 1G     |
| PostgreSQL    | 1   | 1G     |
| Redis         | 0.5 | 512M   |
| MongoDB       | 1   | 1G     |
| Portainer     | 0.5 | 256M   |
| N8N           | 1   | 1G     |
| Actual Budget | 0.5 | 256M   |

## 🔧 Useful Commands

### Start a service

```bash
docker compose up -d
```

### Stop a service

```bash
docker compose down
```

### View logs

```bash
docker compose logs -f
```

### Update image to latest version

```bash
docker compose pull
docker compose up -d
```

### Update all services at once

```bash
# From root folder
for dir in docker/*/; do
  if [ -f "$dir/docker-compose.yml" ]; then
    echo "Updating $dir..."
    (cd "$dir" && docker compose pull && docker compose up -d)
  fi
done
```

## 🔐 Security

- Never commit `.env` file to the repository
- Use strong passwords for all services
- Consider using Docker secrets for production

## 📝 Notes

- All services use the `homelab` network for inter-container communication
- Data is stored in `./data` folder within each service directory
- Default ports can be changed as needed

## 📄 License

MIT License - Free to use and modify
