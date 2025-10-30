#!/bin/bash
# DevOps Simulator Deployment Script
# Handles both Production and Development environments
# Usage: ./deploy.sh [production|development]

set -e

# Determine environment
DEPLOY_ENV=${1:-production}

echo "====================================="
echo "DevOps Simulator - $DEPLOY_ENV Deploy"
echo "====================================="

# Configuration based on environment
if [ "$DEPLOY_ENV" == "production" ]; then
    APP_PORT=8080
    DEPLOY_REGION="us-east-1"
    echo "Environment: $DEPLOY_ENV"
    echo "Region: $DEPLOY_REGION"
    echo "Port: $APP_PORT"

    echo "Running pre-deployment checks..."
    if [ ! -f "config/app-config.yaml" ]; then
        echo "Error: Configuration file not found!"
        exit 1
    fi

    # Deploy application (Production)
    echo "Starting production deployment..."
    echo "Pulling latest Docker images..."
    # docker pull devops-simulator:latest

    echo "Rolling update strategy initiated..."
    # kubectl rolling-update devops-simulator

    echo "Deployment completed successfully!"
    echo "Application available at: https://app.example.com"

elif [ "$DEPLOY_ENV" == "development" ]; then
    APP_PORT=3000
    DEPLOY_MODE="docker-compose"
    ENABLE_DEBUG=true

    echo "Environment: $DEPLOY_ENV"
    echo "Mode: $DEPLOY_MODE"
    echo "Port: $APP_PORT"
    echo "Debug: $ENABLE_DEBUG"

    echo "Running pre-deployment checks..."
    if [ ! -f "config/app-config.yaml" ]; then
        echo "Error: Configuration file not found!"
        exit 1
    fi

    # Install dependencies
    echo "Installing dependencies..."
    npm install

    # Run tests
    echo "Running tests..."
    npm test

    # Deploy application (Development)
    echo "Starting deployment..."
    echo "Using Docker Compose..."
    docker-compose up -d

    # Wait for application to start
    echo "Waiting for application to be ready..."
    sleep 5

    # Health check
    echo "Performing health check..."
    curl -f http://localhost:$APP_PORT/health || exit 1

    echo "Deployment completed successfully!"
    echo "Application available at: http://localhost:$APP_PORT"
    echo "Hot reload enabled - code changes will auto-refresh"

else
    echo "Error: Unknown environment '$DEPLOY_ENV'"
    echo "Usage: $0 [production|development]"
    exit 1
fi
