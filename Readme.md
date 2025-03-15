# Istio Rate Limit Deep Dive

The repo contains a sample on how to configure istio rate limit for multiple rules that need to be enforced in parallel.
The walkthrough covers the following modules :

| Step | Description | Link |
|------|-------------|------|
| 0 | Setup and create Kind cluster with Istio and Istio gateway | [Readme](./0-setup/README.md) |
| 1 | Install a sample app and create Gateway and virtual service | [Readme](./1-application/README.md) |
| 2 | Install Istio rate limit service | [Readme](./step2/README.md) |
| 3 | Configure rate limit based on a path | [Readme](./step3/README.md) |
| 4 | Add rate limit per user-Id | [Readme](./step4/README.md) |

blog : www.tshaiman.medium.com
