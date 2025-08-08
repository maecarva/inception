# inception

> "inception" Project – École 42 Paris

## Overview

`inception` is a full-stack deployment and orchestration project using Docker and Docker Compose. Developed at 42 Paris, this project involves building a multi-service environment with web, database, proxy, and optional monitoring services to simulate a production-like microservices architecture.

## Key Features

- **Custom Dockerfiles:** Crafted optimized images for Nginx, PHP-FPM (WordPress), MariaDB, and other services.
- **Docker Compose Orchestration:** Defines service relationships, networks, volumes, and environment variables in a single YAML file.
- **Reverse Proxy & SSL:** Configured Nginx as a reverse proxy with self-signed certificates for HTTPS support.
- **Persistent Storage:** Uses Docker volumes to maintain database and WordPress data across container restarts.
- **Healthchecks & Restart Policies:** Ensures service availability and automatic recovery.
- **Bonus Services:**
  - **Adminer:** Lightweight database management interface.
  - **cAdvisor:** Container resource usage and performance monitoring.
  - **Redis:** Caching layer to improve application performance.
  - **Static Site:** Served via Nginx to demonstrate multi-service hosting.
  - **VSFTPD:** FTP server for file transfers.

## Installation & Usage

```bash
# Clone the repository
git clone https://github.com/maecarva/inception.git

# Navigate into the deployment directory
cd inception

# Launch all services
make
```

- Access your WordPress site at: https://localhost:443/
- Access static website at : http://localhost:3001/
- Manage the database with Adminer at: https://localhost:443/adminer.php
- Monitor containers with cAdvisor at: http://localhost:8080/

To stop and remove all containers, networks, and volumes:

```bash
make fclean
```

## Skills Gained

- Wrote **Dockerfiles** with best practices: caching, layering, minimal base images.
- Managed multi-container stacks with **Docker Compose**: networks, volumes, and environment variables.
- Configured **Nginx** for load balancing, reverse proxy, and SSL termination.
- Implemented **persistent storage** and automatic **healthchecks**.
- Integrated **monitoring** and **caching** services for a production-like setup.
- Automated builds and deployments using make targets in the provided **Makefile**.

## Project Structure

```plaintext
├── Makefile                 # Automation for build, start, stop, cleanup
└── srcs
    ├── docker-compose.yml   # Orchestrates all services
    └── requirements         # Service configurations
        ├── mariadb          # Dockerfile and configs for MariaDB
        ├── nginx            # Reverse proxy and SSL setup
        └── wordpress        # WordPress with PHP-FPM and configs
    └── requirements/bonus   # Optional bonus services
        ├── adminer          # Adminer database GUI
        ├── cadvisor         # Container monitoring service
        ├── redis            # Redis caching service
        ├── static           # Example static website
        └── vsftpd           # VSFTPD FTP server
```