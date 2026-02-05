# ================================
# 🏠 My Homelab Makefile
# ================================

# Docker Compose with env file
DOCKER_COMPOSE = docker compose --env-file .env

# Phony targets sorted alphabetically
.PHONY: help network
.PHONY: start-all stop-all update-all logs-all
.PHONY: start-actual-budget stop-actual-budget update-actual-budget logs-actual-budget
.PHONY: start-adguard-home stop-adguard-home update-adguard-home logs-adguard-home
.PHONY: start-beszel stop-beszel update-beszel logs-beszel
.PHONY: start-changedetection stop-changedetection update-changedetection logs-changedetection
.PHONY: start-flaresolverr stop-flaresolverr update-flaresolverr logs-flaresolverr
.PHONY: start-grafana stop-grafana update-grafana logs-grafana
.PHONY: start-it-tools stop-it-tools update-it-tools logs-it-tools
.PHONY: start-listmonk stop-listmonk update-listmonk logs-listmonk
.PHONY: start-mariadb stop-mariadb update-mariadb logs-mariadb
.PHONY: start-mongodb stop-mongodb update-mongodb logs-mongodb
.PHONY: start-n8n stop-n8n update-n8n logs-n8n
.PHONY: start-ollama stop-ollama update-ollama logs-ollama
.PHONY: start-open-webui stop-open-webui update-open-webui logs-open-webui
.PHONY: start-openspeedtest stop-openspeedtest update-openspeedtest logs-openspeedtest
.PHONY: start-portainer stop-portainer update-portainer logs-portainer
.PHONY: start-postgres stop-postgres update-postgres logs-postgres
.PHONY: start-redis stop-redis update-redis logs-redis
.PHONY: start-ryot stop-ryot update-ryot logs-ryot
.PHONY: start-serpbear stop-serpbear update-serpbear logs-serpbear
.PHONY: start-smokeping stop-smokeping update-smokeping logs-smokeping
.PHONY: start-socks5 stop-socks5 update-socks5 logs-socks5
.PHONY: start-stirling-pdf stop-stirling-pdf update-stirling-pdf logs-stirling-pdf
.PHONY: start-uptime-kuma stop-uptime-kuma update-uptime-kuma logs-uptime-kuma
.PHONY: start-wallos stop-wallos update-wallos logs-wallos
.PHONY: start-wealthfolio stop-wealthfolio update-wealthfolio logs-wealthfolio

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
	@echo "Available services (A-Z):"
	@echo "  actual-budget, adguard-home, beszel, changedetection,"
	@echo "  flaresolverr, grafana, it-tools, listmonk,"
	@echo "  mariadb, mongodb, n8n, ollama, open-webui,"
	@echo "  openspeedtest, portainer, postgres, redis, ryot,"
	@echo "  serpbear, smokeping, socks5, stirling-pdf, uptime-kuma, wallos,"
	@echo "  wealthfolio"
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
# All Services (Sorted A-Z)
# ================================
start-all: network
	@echo "Starting all services..."
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml up -d
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml up -d
	@echo "✅ All services started!"

stop-all:
	@echo "Stopping all services..."
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml down
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml down
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml down
	@echo "✅ All services stopped!"

update-all: network
	@echo "Updating all services..."
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml pull
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml up -d
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml up -d
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml up -d
	@echo "✅ All services updated!"

logs-all:
	@echo "Use 'make logs-<service>' for individual service logs"

# ================================
# Actual Budget
# ================================
start-actual-budget: network
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml up -d

stop-actual-budget:
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml down

update-actual-budget: network
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml up -d

logs-actual-budget:
	$(DOCKER_COMPOSE) -f docker/actual-budget/docker-compose.yml logs -f

# ================================
# AdGuard Home
# ================================
start-adguard-home: network
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml up -d

stop-adguard-home:
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml down

update-adguard-home: network
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml up -d

logs-adguard-home:
	$(DOCKER_COMPOSE) -f docker/adguard-home/docker-compose.yml logs -f

# ================================
# Beszel
# ================================
start-beszel: network
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml up -d

stop-beszel:
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml down

update-beszel: network
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml up -d

logs-beszel:
	$(DOCKER_COMPOSE) -f docker/beszel/docker-compose.yml logs -f

# ================================
# ChangeDetection
# ================================
start-changedetection: network
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml up -d

stop-changedetection:
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml down

update-changedetection: network
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml up -d

logs-changedetection:
	$(DOCKER_COMPOSE) -f docker/changedetection/docker-compose.yml logs -f

# ================================
# FlareSolverr
# ================================
start-flaresolverr: network
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml up -d

stop-flaresolverr:
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml down

update-flaresolverr: network
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml up -d

logs-flaresolverr:
	$(DOCKER_COMPOSE) -f docker/flaresolverr/docker-compose.yml logs -f

# ================================
# Grafana
# ================================
start-grafana: network
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml up -d

stop-grafana:
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml down

update-grafana: network
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml up -d

logs-grafana:
	$(DOCKER_COMPOSE) -f docker/grafana/docker-compose.yml logs -f

# ================================
# IT Tools
# ================================
start-it-tools: network
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml up -d

stop-it-tools:
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml down

update-it-tools: network
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml up -d

logs-it-tools:
	$(DOCKER_COMPOSE) -f docker/it-tools/docker-compose.yml logs -f

# ================================
# Listmonk
# ================================
start-listmonk: network
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml up -d

stop-listmonk:
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml down

update-listmonk: network
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml up -d

logs-listmonk:
	$(DOCKER_COMPOSE) -f docker/listmonk/docker-compose.yml logs -f

# ================================
# MariaDB
# ================================
start-mariadb: network
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml up -d

stop-mariadb:
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml down

update-mariadb: network
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml up -d

logs-mariadb:
	$(DOCKER_COMPOSE) -f docker/mariadb/docker-compose.yml logs -f

# ================================
# MongoDB
# ================================
start-mongodb: network
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml up -d

stop-mongodb:
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml down

update-mongodb: network
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml up -d

logs-mongodb:
	$(DOCKER_COMPOSE) -f docker/mongodb/docker-compose.yml logs -f

# ================================
# N8N
# ================================
start-n8n: network
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml up -d

stop-n8n:
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml down

update-n8n: network
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml up -d

logs-n8n:
	$(DOCKER_COMPOSE) -f docker/n8n/docker-compose.yml logs -f

# ================================
# Ollama
# ================================
start-ollama: network
	$(DOCKER_COMPOSE) -f docker/ollama/docker-compose.yml up -d

stop-ollama:
	$(DOCKER_COMPOSE) -f docker/ollama/docker-compose.yml down

update-ollama: network
	$(DOCKER_COMPOSE) -f docker/ollama/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/ollama/docker-compose.yml up -d

logs-ollama:
	$(DOCKER_COMPOSE) -f docker/ollama/docker-compose.yml logs -f

# ================================
# Open WebUI
# ================================
start-open-webui: network
	$(DOCKER_COMPOSE) -f docker/open-webui/docker-compose.yml up -d

stop-open-webui:
	$(DOCKER_COMPOSE) -f docker/open-webui/docker-compose.yml down

update-open-webui: network
	$(DOCKER_COMPOSE) -f docker/open-webui/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/open-webui/docker-compose.yml up -d

logs-open-webui:
	$(DOCKER_COMPOSE) -f docker/open-webui/docker-compose.yml logs -f

# ================================
# OpenSpeedTest
# ================================
start-openspeedtest: network
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml up -d

stop-openspeedtest:
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml down

update-openspeedtest: network
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml up -d

logs-openspeedtest:
	$(DOCKER_COMPOSE) -f docker/openspeedtest/docker-compose.yml logs -f

# ================================
# Portainer
# ================================
start-portainer: network
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml up -d

stop-portainer:
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml down

update-portainer: network
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml up -d

logs-portainer:
	$(DOCKER_COMPOSE) -f docker/portainer/docker-compose.yml logs -f

# ================================
# PostgreSQL
# ================================
start-postgres: network
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml up -d

stop-postgres:
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml down

update-postgres: network
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml up -d

logs-postgres:
	$(DOCKER_COMPOSE) -f docker/postgres/docker-compose.yml logs -f

# ================================
# Redis
# ================================
start-redis: network
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml up -d

stop-redis:
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml down

update-redis: network
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml up -d

logs-redis:
	$(DOCKER_COMPOSE) -f docker/redis/docker-compose.yml logs -f

# ================================
# Ryot
# ================================
start-ryot: network
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml up -d

stop-ryot:
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml down

update-ryot: network
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml up -d

logs-ryot:
	$(DOCKER_COMPOSE) -f docker/ryot/docker-compose.yml logs -f

# ================================
# SerpBear
# ================================
start-serpbear: network
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml up -d

stop-serpbear:
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml down

update-serpbear: network
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml up -d

logs-serpbear:
	$(DOCKER_COMPOSE) -f docker/serpbear/docker-compose.yml logs -f

# ================================
# SmokePing
# ================================
start-smokeping: network
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml up -d

stop-smokeping:
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml down

update-smokeping: network
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml up -d

logs-smokeping:
	$(DOCKER_COMPOSE) -f docker/smokeping/docker-compose.yml logs -f

# ================================
# Socks5
# ================================
start-socks5: network
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml up -d

stop-socks5:
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml down

update-socks5: network
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml pull
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml up -d

logs-socks5:
	$(DOCKER_COMPOSE) -f docker/socks5/docker-compose.yaml logs -f

# ================================
# Stirling PDF
# ================================
start-stirling-pdf: network
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml up -d

stop-stirling-pdf:
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml down

update-stirling-pdf: network
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml up -d

logs-stirling-pdf:
	$(DOCKER_COMPOSE) -f docker/stirling-pdf/docker-compose.yml logs -f

# ================================
# Uptime Kuma
# ================================
start-uptime-kuma: network
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml up -d

stop-uptime-kuma:
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml down

update-uptime-kuma: network
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml up -d

logs-uptime-kuma:
	$(DOCKER_COMPOSE) -f docker/uptime-kuma/docker-compose.yml logs -f

# ================================
# Wallos
# ================================
start-wallos: network
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml up -d

stop-wallos:
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml down

update-wallos: network
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml up -d

logs-wallos:
	$(DOCKER_COMPOSE) -f docker/wallos/docker-compose.yml logs -f

# ================================
# Wealthfolio
# ================================
start-wealthfolio: network
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml up -d

stop-wealthfolio:
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml down

update-wealthfolio: network
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml pull
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml up -d

logs-wealthfolio:
	$(DOCKER_COMPOSE) -f docker/wealthfolio/docker-compose.yml logs -f