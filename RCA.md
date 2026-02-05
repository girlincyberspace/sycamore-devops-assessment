## Root Cause Analysis (RCA)

Incident Summary

The sycamore-api service returned intermittent 502 errors when accessed via Kubernetes Service.

Impact

The application was unreachable because backend pods continuously crashed and never became Ready.

Root Cause

The container was repeatedly OOMKilled due to:

An intentionally memory-leaking Node.js process

An unrealistically low memory limit (64Mi)

As a result, the pod entered CrashLoopBackOff, leaving the Service with zero healthy endpoints, which caused 502 responses.

Detection

The issue was identified by:

Inspecting pod events (OOMKilled, exit code 137)

Observing CrashLoopBackOff status

Verifying memory limits and container command

Confirming pods never reached Ready state

Resolution

The issue was resolved by:

Fixing the application behavior (removing the memory leak)

Increasing memory limits to realistic values

Adding health probes to ensure Kubernetes only routes traffic to healthy pods

Prevention / Long-Term Stability

Enforce sane resource limits for Node.js workloads

Use readiness & liveness probes

Avoid unbounded in-memory data structures

Monitor memory usage (metrics-server / Prometheus)