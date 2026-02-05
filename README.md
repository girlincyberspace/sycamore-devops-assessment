# Secure CI/CD Pipeline

## Overview
This repository demonstrates a secure CI/CD pipeline for a Node.js application using GitHub Actions.

## Pipeline Architecture
- Docker is used to containerize the application
- GitHub Actions automates build, scan, and publish steps
- GitHub Container Registry (GHCR) stores built images

## Security Controls
- Trivy is integrated to scan container images
- The pipeline fails on HIGH or CRITICAL vulnerabilities
- Images are only pushed when security checks pass

## Proof of Security Gate
- A failed pipeline run is present due to a vulnerable dependency
- A successful run follows after remediation of vulnerabilities

## Why Trivy
Trivy was chosen for its simplicity, fast execution, and native support for container image scanning in CI pipelines.
