# CI/CD Pipeline for a Containerized Web App on Kubernetes

## Overview
This project demonstrates a complete, production-style DevOps workflow: a web application is version-controlled, automatically tested and built via CI/CD, containerized with Docker, deployed to a Kubernetes cluster, and monitored using Prometheus and Grafana. Infrastructure is provisioned using Terraform, following Infrastructure as Code (IaC) principles.

The goal of this project was to understand and implement how modern engineering teams ship software reliably and repeatably — not just to use individual tools in isolation.


## Architecture Overview
<img src="/https://lh3.googleusercontent.com/gg/ACRwjatQvpSBNMw9uIV6K5zVeUdWgxVuXgPdxsqxgRd5TKHSmfa8UBRhTy2n4vbhBEd-lpz5g5pb9JxZ0huXfAdTIb92wm7hUEaP1XoAVhNyIxTaAqdypJH_05fgHV28zV7MIjUgf1kbYXmvBAE9NvIbdStT9edkhzWf6rmcypzTQFlFHQO6eXc_BVhSv8do_b8yiU9A9UoXOzE4FfaZpEaa03oxyih2SqUX2Hl7ZRG4qherz6vBvbOnqOweja3o20pr1rDbo1RXFBuEfYGtJoO8jCw-K7tYVHQEXG74cI772UQNmueo6bQatzfoxyL_mL53QYKUnpQktewfQ5y7ZDNgMvw=s1600" width="300" alt="Description">

This diagram shows the end-to-end pipeline...
```
Developer → GitHub (source control)
              │
              ▼
     GitHub Actions (CI/CD)
      │           │
   Run Tests   Build Docker Image
              │
              ▼
     Push to Container Registry
     (Docker Hub / GHCR)
              │
              ▼
   Deploy to Kubernetes Cluster
   (provisioned via Terraform)
              │
              ▼
  App Pods running on Kubernetes
              │
              ▼
   Prometheus scrapes metrics
              │
              ▼
     Grafana Dashboard (visualized)
```

*(Replace this with an actual diagram image — draw.io, Excalidraw, or Lucidchart all export free PNGs. Add it as `architecture.png` and embed it here.)*

## Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| Source Control | Git + GitHub | Version control and collaboration |
| CI/CD | GitHub Actions | Automated testing, building, deployment |
| Containerization | Docker | Packaging the app consistently |
| Container Registry | Docker Hub / GHCR | Storing and versioning images |
| Orchestration | Kubernetes (Minikube/Kind or cloud) | Running and scaling the app |
| Infrastructure as Code | Terraform | Provisioning cloud resources reproducibly |
| Cloud Provider | AWS (free tier) | Hosting infrastructure |
| Monitoring | Prometheus + Grafana | Metrics collection and visualization |
| Config Management | Kubernetes ConfigMaps & Secrets | Managing app configuration securely |

## What This Project Demonstrates
- Setting up a CI/CD pipeline that runs tests before building/deploying, preventing broken code from reaching production
- Writing a multi-stage Dockerfile for smaller, more secure images
- Deploying and managing an application on Kubernetes using Deployments, Services, and Ingress
- Provisioning cloud infrastructure with Terraform instead of manual setup
- Setting up real-time monitoring and building a Grafana dashboard to track application health
- Managing secrets and configuration outside of application code

## How to Run This Locally
```bash
# Clone the repo
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>

# Build and run with Docker
docker build -t <app-name> .
docker run -p 5000:5000 <app-name>

# Deploy to local Kubernetes (Minikube)
minikube start
kubectl apply -f k8s/

# Access Grafana dashboard
kubectl port-forward svc/grafana 3000:3000
```

## Challenges & Learnings
*(Fill this in as you build — interviewers love this section. Examples of what to write about:)*
- A specific bug you hit (e.g. a pod crash-looping) and how you debugged it
- A tradeoff you made (e.g. why you chose GitHub Actions over Jenkins)
- Something that didn't work the first time and what you changed

## Future Improvements
- Add Helm charts for templated Kubernetes deployments
- Add auto-scaling based on CPU/memory metrics
- Add a staging environment before production deploys
- Integrate Slack/Discord alerts from Prometheus Alertmanager

## Author
**[Your Name]**
[LinkedIn] · [GitHub] · [Email]
