#!/bin/bash
# Darlinx Web Developer Profile
# For frontend, backend, and full-stack web development
# Requires: Base profile installed first + Docker from dev profile (optional overlap)

###############################################################################
# JAVASCRIPT RUNTIMES & PACKAGE MANAGERS
###############################################################################
js_packages=(
    "nodejs"                     # Node.js runtime
    "npm"                        # npm package manager
    "yarn"                       # Yarn PM
    "pnpm"                       # PNPM (fast, disk-efficient)
    
    # Version management
    "nvm-bin"                    # Node version manager
    "fnm"                        # Fast Node Manager
)

###############################################################################
# WEB SERVERS & APPLICATION STACKS
###############################################################################
server_packages=(
    "nginx"                      # High-performance web server
    "apache"                     # Apache HTTP Server
    "httpd-tools"                # Apache utilities
    
    # Backend runtimes
    "php-fpm"                    # PHP FastCGI Process Manager
    "composer"                   # PHP dependency manager
    "golang"                     # Go (for modern web backends)
)

###############################################################################
# DATABASES & CACHING
###############################################################################
database_packages=(
    "postgresql"                 # PostgreSQL database server
    "mariadb"                    # MariaDB/MySQL fork
    "mongodb"                    # MongoDB document database
    
    # Caching layers
    "redis"                      # Redis in-memory store
    "memcached"                  # Distributed memory caching
)

###############################################################################
# CONTAINERIZATION & LOCAL ENVIRONMENTS
###############################################################################
container_packages=(
    "docker"                     # Docker engine (also in dev profile - dedupe needed)
    "docker-compose"             # Docker Compose
    "portainer-bin"              # Web-based Docker UI
    "podman"                     # Rootless containers
    "podman-docker"              # Podman Docker compatibility layer
)

###############################################################################
# FRONTEND TOOLS & FRAMEWORKS
###############################################################################
frontend_packages=(
    "vue-cli"                    # Vue.js CLI
    "@angular/cli"               # Angular CLI
    "create-react-app-bin"       # React app generator
    
    # Build tools
    "vite"                       # Next-gen frontend build tool
    "parcel"                     # Zero-config bundler
    "webpack"                    # Module bundler
    
    # CSS & styling
    "tailwindcss-cli"            # Utility-first CSS framework
    "sass"                       # SCSS preprocessor
)

###############################################################################
# API DEVELOPMENT & TESTING
###############################################################################
api_packages=(
    "postman-bin"                # Postman API client
    "insomnia-bin"               # Insomnia REST client
    "graphql-cli"                # GraphQL development tools
    
    # Mock servers
    "json-server"                # Fake REST API for testing
    "prism-cli"                  # OpenAPI mock server
)

###############################################################################
# VIRTUALIZATION & LOCAL TESTING
###############################################################################
virt_packages=(
    "vagrant"                    # Virtual machine manager
    "ansible-core"               # Configuration management (local dev)
    
    # Local DNS resolution for development
    "dnsmasq"                    # Lightweight DNS server
    "hostapd"                    # Host AP daemon (WiFi testing)
)

###############################################################################
# WEBSITE ANALYTICS & SEO TOOLS
###############################################################################
analytics_packages=(
    "google-chrome"              # Chrome browser for DevTools (optional to Firefox base)
    "lighthouse-cli"             # Google Lighthouse audits
    
    # Web performance
    "pagespeed-insights"         # PageSpeed metrics
    "webpagetest"                # Website performance testing CLI
)

###############################################################################
# DEVOPS & DEPLOYMENT TOOLS
###############################################################################
deploy_packages=(
    "terraform-bin"              # Infrastructure as Code
    "ansible-lint"               # Ansible code linter
    
    # Cloud CLIs (optional, user selects during first-boot)
    # "aws-cli"                 # AWS Command Line Interface
    # "gcloud"                  # Google Cloud SDK
    # "azure-cli"               # Microsoft Azure CLI
)

###############################################################################
# UTILITY PACKAGES FOR WEBDEV
###############################################################################
webdev_utils=(
    "httpie"                     # HTTP client (also in dev profile - dedupe needed)
    "jq"                         # JSON processor
    "yq"                         # YAML processor
    
    # Static site generators
    "hugo"                       # Hugo static site generator
    "jekyll-bin"                # Jekyll Ruby-based SSG
)

# Export all arrays for Calamares integration
export -f install_webdev_profile
export js_packages server_packages database_packages container_packages \
       frontend_packages api_packages virt_packages analytics_packages \
       deploy_packages webdev_utils