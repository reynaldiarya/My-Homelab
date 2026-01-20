# ================================
# 🏠 My Homelab Makefile
# ================================

.PHONY: help network
.PHONY: start-all stop-all update-all logs-all
.PHONY: start-mariadb stop-mariadb update-mariadb logs-mariadb
.PHONY: start-postgres stop-postgres update-postgres logs-postgres
.PHONY: start-redis stop-redis update-redis logs-redis
.PHONY: start-mongodb stop-mongodb update-mongodb logs-mongodb
.PHONY: start-portainer stop-portainer update-portainer logs-portainer
.PHONY: start-n8n stop-n8n update-n8n logs-n8n
.PHONY: start-actual-budget stop-actual-budget update-actual-budget logs-actual-budget
.PHONY: start-serpbear stop-serpbear update-serpbear logs-serpbear
.PHONY: start-changedetection stop-changedetection update-changedetection logs-changedetection
.PHONY: start-wallos stop-wallos update-wallos logs-wallos
.PHONY: start-stirling-pdf stop-stirling-pdf update-stirling-pdf logs-stirling-pdf
.PHONY: start-listmonk stop-listmonk update-listmonk logs-listmonk

# Default target
help:
	@echo "================================"
	@echo "🏠 My Homelab Commands"
	@echo "================================"
	@echo ""
	@echo "Setup:"
	@echo "  make network          - Create homelab network"
	@echo ""
	@echo "All Services:"
	@echo "  make start-all        - Start all services"
	@echo "  make stop-all         - Stop all services"
	@echo "  make update-all       - Update all services"
	@echo ""
	@echo "Individual Services:"
	@echo "  make start-<service>  - Start a service"
	@echo "  make stop-<service>   - Stop a service"
	@echo "  make update-<service> - Update a service"
	@echo "  make logs-<service>   - View service logs"
	@echo ""
	@echo "Available services:"
	@echo "  mariadb, postgres, redis, mongodb, portainer,"
	@echo "  n8n, actual-budget, serpbear, changedetection,"
	@echo "  wallos, stirling-pdf, listmonk"
	@echo ""
	@echo "Examples:"
	@echo "  make start-mariadb"
	@echo "  make logs-portainer"
	@echo "  make update-all"

# ================================
# Setup
# ================================
network:
	docker network create homelab || true

# ================================
# All Services
# ================================
start-all: network
	@echo "Starting all services..."
	docker compose -f docker/mariadb/docker-compose.yml up -d
	docker compose -f docker/postgres/docker-compose.yml up -d
	docker compose -f docker/redis/docker-compose.yml up -d
	docker compose -f docker/mongodb/docker-compose.yml up -d
	docker compose -f docker/portainer/docker-compose.yml up -d
	docker compose -f docker/n8n/docker-compose.yml up -d
	docker compose -f docker/actual-budget/docker-compose.yml up -d
	docker compose -f docker/serpbear/docker-compose.yml up -d
	docker compose -f docker/changedetection/docker-compose.yml up -d
	docker compose -f docker/wallos/docker-compose.yml up -d
	docker compose -f docker/stirling-pdf/docker-compose.yml up -d
	docker compose -f docker/listmonk/docker-compose.yml up -d
	@echo "✅ All services started!"

stop-all:
	@echo "Stopping all services..."
	docker compose -f docker/mariadb/docker-compose.yml down
	docker compose -f docker/postgres/docker-compose.yml down
	docker compose -f docker/redis/docker-compose.yml down
	docker compose -f docker/mongodb/docker-compose.yml down
	docker compose -f docker/portainer/docker-compose.yml down
	docker compose -f docker/n8n/docker-compose.yml down
	docker compose -f docker/actual-budget/docker-compose.yml down
	docker compose -f docker/serpbear/docker-compose.yml down
	docker compose -f docker/changedetection/docker-compose.yml down
	docker compose -f docker/wallos/docker-compose.yml down
	docker compose -f docker/stirling-pdf/docker-compose.yml down
	docker compose -f docker/listmonk/docker-compose.yml down
	@echo "✅ All services stopped!"

update-all: network
	@echo "Updating all services..."
	docker compose -f docker/mariadb/docker-compose.yml pull
	docker compose -f docker/mariadb/docker-compose.yml up -d
	docker compose -f docker/postgres/docker-compose.yml pull
	docker compose -f docker/postgres/docker-compose.yml up -d
	docker compose -f docker/redis/docker-compose.yml pull
	docker compose -f docker/redis/docker-compose.yml up -d
	docker compose -f docker/mongodb/docker-compose.yml pull
	docker compose -f docker/mongodb/docker-compose.yml up -d
	docker compose -f docker/portainer/docker-compose.yml pull
	docker compose -f docker/portainer/docker-compose.yml up -d
	docker compose -f docker/n8n/docker-compose.yml pull
	docker compose -f docker/n8n/docker-compose.yml up -d
	docker compose -f docker/actual-budget/docker-compose.yml pull
	docker compose -f docker/actual-budget/docker-compose.yml up -d
	docker compose -f docker/serpbear/docker-compose.yml pull
	docker compose -f docker/serpbear/docker-compose.yml up -d
	docker compose -f docker/changedetection/docker-compose.yml pull
	docker compose -f docker/changedetection/docker-compose.yml up -d
	docker compose -f docker/wallos/docker-compose.yml pull
	docker compose -f docker/wallos/docker-compose.yml up -d
	docker compose -f docker/stirling-pdf/docker-compose.yml pull
	docker compose -f docker/stirling-pdf/docker-compose.yml up -d
	docker compose -f docker/listmonk/docker-compose.yml pull
	docker compose -f docker/listmonk/docker-compose.yml up -d
	@echo "✅ All services updated!"

logs-all:
	@echo "Use 'make logs-<service>' for individual service logs"

# ================================
# MariaDB
# ================================
start-mariadb: network
	docker compose -f docker/mariadb/docker-compose.yml up -d

stop-mariadb:
	docker compose -f docker/mariadb/docker-compose.yml down

update-mariadb: network
	docker compose -f docker/mariadb/docker-compose.yml pull
	docker compose -f docker/mariadb/docker-compose.yml up -d

logs-mariadb:
	docker compose -f docker/mariadb/docker-compose.yml logs -f

# ================================
# PostgreSQL
# ================================
start-postgres: network
	docker compose -f docker/postgres/docker-compose.yml up -d

stop-postgres:
	docker compose -f docker/postgres/docker-compose.yml down

update-postgres: network
	docker compose -f docker/postgres/docker-compose.yml pull
	docker compose -f docker/postgres/docker-compose.yml up -d

logs-postgres:
	docker compose -f docker/postgres/docker-compose.yml logs -f

# ================================
# Redis
# ================================
start-redis: network
	docker compose -f docker/redis/docker-compose.yml up -d

stop-redis:
	docker compose -f docker/redis/docker-compose.yml down

update-redis: network
	docker compose -f docker/redis/docker-compose.yml pull
	docker compose -f docker/redis/docker-compose.yml up -d

logs-redis:
	docker compose -f docker/redis/docker-compose.yml logs -f

# ================================
# MongoDB
# ================================
start-mongodb: network
	docker compose -f docker/mongodb/docker-compose.yml up -d

stop-mongodb:
	docker compose -f docker/mongodb/docker-compose.yml down

update-mongodb: network
	docker compose -f docker/mongodb/docker-compose.yml pull
	docker compose -f docker/mongodb/docker-compose.yml up -d

logs-mongodb:
	docker compose -f docker/mongodb/docker-compose.yml logs -f

# ================================
# Portainer
# ================================
start-portainer: network
	docker compose -f docker/portainer/docker-compose.yml up -d

stop-portainer:
	docker compose -f docker/portainer/docker-compose.yml down

update-portainer: network
	docker compose -f docker/portainer/docker-compose.yml pull
	docker compose -f docker/portainer/docker-compose.yml up -d

logs-portainer:
	docker compose -f docker/portainer/docker-compose.yml logs -f

# ================================
# N8N
# ================================
start-n8n: network
	docker compose -f docker/n8n/docker-compose.yml up -d

stop-n8n:
	docker compose -f docker/n8n/docker-compose.yml down

update-n8n: network
	docker compose -f docker/n8n/docker-compose.yml pull
	docker compose -f docker/n8n/docker-compose.yml up -d

logs-n8n:
	docker compose -f docker/n8n/docker-compose.yml logs -f

# ================================
# Actual Budget
# ================================
start-actual-budget: network
	docker compose -f docker/actual-budget/docker-compose.yml up -d

stop-actual-budget:
	docker compose -f docker/actual-budget/docker-compose.yml down

update-actual-budget: network
	docker compose -f docker/actual-budget/docker-compose.yml pull
	docker compose -f docker/actual-budget/docker-compose.yml up -d

logs-actual-budget:
	docker compose -f docker/actual-budget/docker-compose.yml logs -f

# ================================
# SerpBear
# ================================
start-serpbear: network
	docker compose -f docker/serpbear/docker-compose.yml up -d

stop-serpbear:
	docker compose -f docker/serpbear/docker-compose.yml down

update-serpbear: network
	docker compose -f docker/serpbear/docker-compose.yml pull
	docker compose -f docker/serpbear/docker-compose.yml up -d

logs-serpbear:
	docker compose -f docker/serpbear/docker-compose.yml logs -f

# ================================
# ChangeDetection
# ================================
start-changedetection: network
	docker compose -f docker/changedetection/docker-compose.yml up -d

stop-changedetection:
	docker compose -f docker/changedetection/docker-compose.yml down

update-changedetection: network
	docker compose -f docker/changedetection/docker-compose.yml pull
	docker compose -f docker/changedetection/docker-compose.yml up -d

logs-changedetection:
	docker compose -f docker/changedetection/docker-compose.yml logs -f

# ================================
# Wallos
# ================================
start-wallos: network
	docker compose -f docker/wallos/docker-compose.yml up -d

stop-wallos:
	docker compose -f docker/wallos/docker-compose.yml down

update-wallos: network
	docker compose -f docker/wallos/docker-compose.yml pull
	docker compose -f docker/wallos/docker-compose.yml up -d

logs-wallos:
	docker compose -f docker/wallos/docker-compose.yml logs -f

# ================================
# Stirling PDF
# ================================
start-stirling-pdf: network
	docker compose -f docker/stirling-pdf/docker-compose.yml up -d

stop-stirling-pdf:
	docker compose -f docker/stirling-pdf/docker-compose.yml down

update-stirling-pdf: network
	docker compose -f docker/stirling-pdf/docker-compose.yml pull
	docker compose -f docker/stirling-pdf/docker-compose.yml up -d

logs-stirling-pdf:
	docker compose -f docker/stirling-pdf/docker-compose.yml logs -f

# ================================
# Listmonk
# ================================
start-listmonk: network
	docker compose -f docker/listmonk/docker-compose.yml up -d

stop-listmonk:
	docker compose -f docker/listmonk/docker-compose.yml down

update-listmonk: network
	docker compose -f docker/listmonk/docker-compose.yml pull
	docker compose -f docker/listmonk/docker-compose.yml up -d

logs-listmonk:
	docker compose -f docker/listmonk/docker-compose.yml logs -f
