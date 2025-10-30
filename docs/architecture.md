# System Architecture

## Overview
DevOps Simulator follows a microservices architecture designed for high availability and scalability.

---

## Components

### 1. Application Server
- **Technology**: Node.js + Express
- **Production Port**: 8080
- **Development Port**: 3000
- **Scaling**:
  - Production: Horizontal auto-scaling enabled
  - Development: Manual (single instance)
- **Debugging**:
  - Development only: Chrome DevTools debugger on port 9229, hot reload enabled

### 2. Database Layer
- **Database**: PostgreSQL 14
- **Production Configuration**: Master-slave replication, daily automated backups
- **Development Configuration**:
  - Local single instance
  - Manual backups only
  - Auto-seed with test data on startup

### 3. Monitoring System
- **Production**:
  - Tool: Prometheus + Grafana
  - Metrics: CPU, Memory, Disk, Network
  - Alerts: Email notifications for critical issues
- **Development**:
  - Tool: Console logging + optional Prometheus
  - Metrics: CPU, Memory, Disk, Network, Build time
  - Alerts: Console warnings
  - Dashboard: In-development web dashboard

### 4. Container Orchestration (Development Only)
- **Tool**: Docker Compose (local)
- **Services**: App, Database, Redis cache
- **Volume Mounts**: Code directory for hot reload

### 5. Authentication System (Development Only, Beta)
- **Method**: OAuth2 + JWT
- **Providers**: Google, GitHub (for testing)
- **Sessions**: Redis-based session storage

---

## Deployment Strategy
- **Production**:
  - Method: Rolling updates
  - Zero-downtime: Yes
  - Rollback: Automated on failure
- **Development**:
  - Method: Docker Compose with hot reload
  - Zero-downtime: Not applicable
  - Rollback: Git checkout previous commit

---

## Development Workflow
1. Make code changes
2. Auto-reload triggers rebuild
3. Run unit tests
4. Check console logs
5. Commit when ready

---

## Security
- **Production**:
  - SSL/TLS encryption
  - Database connection encryption
  - Regular security audits
- **Development**:
  - SSL/TLS disabled for local development
  - Database credentials in plain text
  - CORS enabled for all origins
  - Debug endpoints exposed

---

## Experimental Features (Development Only)
⚠️ **Warning**: The following features are experimental:
- Multi-cloud deployment
- AI-powered log analysis
- Automatic rollback on anomaly detection
