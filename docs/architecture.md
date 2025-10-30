system_architecture:

  overview: >
    DevOps Simulator follows a modular microservices architecture designed
    for high availability, scalability, and experimental AI/ML integration.
    Experimental features are available only in testing/development environments.

  application_server:
    technology: "Node.js + Express"
    experimental_tech: "TensorFlow.js (optional)"
    ports:
      production: 8080
      development: 3000
      experimental:
        main: 9000
        metrics: 9001
        ai_api: 9002
    scaling:
      production: "Horizontal auto-scaling enabled"
      development: "Manual single instance"
      experimental: "AI-powered predictive auto-scaling"
    debugging:
      development: "Chrome DevTools on port 9229, hot reload enabled"
      experimental: "Real-time ML inference & Apache Kafka message queue"

  database_layer:
    database: "PostgreSQL 14"
    production:
      replication: "Master-slave"
      backups: "Daily automated"
      ssl: true
    development:
      replication: "Single instance"
      backups: "Manual only"
      auto_seed: true
    experimental:
      replication: "Distributed multi-master cluster"
      cache: "Redis cluster with AI optimization"
      backups: "Continuous geo-redundant"
      ai_features:
        - "Query optimization"
        - "Index suggestions"

  monitoring_observability:
    production:
      tools: ["Prometheus", "Grafana"]
      metrics: ["CPU", "Memory", "Disk", "Network"]
      alerts: "Email notifications"
    development:
      tools: ["Console logging", "Optional Prometheus"]
      metrics: ["CPU", "Memory", "Disk", "Network", "Build time"]
      dashboard: "In-development web interface"
    experimental:
      tools: ["Prometheus", "Thanos", "ELK Stack"]
      ai_analysis: true
      anomaly_detection: true

  container_orchestration:
    development:
      tool: "Docker Compose"
      services: ["App", "Database", "Redis"]
      volume_mounts: "Hot reload enabled"
    experimental:
      tool: "Kubernetes multi-cloud"
      clouds: ["AWS", "Azure", "GCP", "DigitalOcean"]
      load_balancing: "Global anycast with GeoDNS"
      failover: "Automatic cross-cloud"

  authentication_security:
    production:
      ssl_tls: true
      db_encryption: true
      audits: "Regular"
    development:
      auth_method: "OAuth2 + JWT"
      session_storage: "Redis"
      debug_endpoints: true
    experimental:
      zero_trust: true
      encryption: "AES-256"
      audit_logging: "Comprehensive"

  deployment_strategy:
    production:
      method: "Rolling updates"
      zero_downtime: true
      rollback: "Automated on failure"
    development:
      method: "Docker Compose with hot reload"
      rollback: "Git previous commit"
    experimental:
      method: "Event-driven with AI auto-scaling"
      chaos_engineering: true

  development_workflow:
    steps:
      - "Make code changes"
      - "Auto-reload triggers rebuild"
      - "Run unit tests"
      - "Check console logs and AI feedback (experimental mode)"
      - "Commit when ready"

  experimental_features:
    - "Multi-cloud deployment"
    - "AI-powered log analysis & anomaly detection"
    - "Automatic rollback on anomalies"
    - "Predictive auto-scaling and resource optimization"
