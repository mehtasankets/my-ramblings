---
title: "Mentoring Docker: Week 4"
date: 2018-10-01T15:25:19+02:00
publishdate: 2018-10-07T11:17:14+02:00
lastmod: 2018-10-08T18:55:29+02:00
tags: ["arcesium", "exl", "docker", "week 4"]
type: "post"
comments: true
---

Welcome to 4th and last blog post on mentoring docker. This week is all about understanding the need for orchestration framework on top of Docker.

### Focus points for the week 4

#### 1. What are the challenges with Docker when we have hundreds of applications each with multiple instances running?
0. **What happens when application crashes?** <br/>
The expectation is to restart the application automatically. We can do it ourselves by writing a small utility over `docker-compose events` / `docker events`. But orchestration frameworks support it by monitoring application health (Kubernetes `liveliness-probe`).
1. **What happens when application crashes and started on another host with another port?** <br/>
Orchestration frameworks provide `service discovery` frameworks to support this.
2. **How to distribute the load when you have multiple copies?** <br/>
Load balancer is used to distribute the load. `Ingress` is one such example of a load balancer.
3. **How to keep x instances of the application running all the time?** <br/>
Orchestration frameworks provide inbuilt support to maintain the instance count by managing replicas (`replicaSet` in Kubernetes terms).
4. **How to run one copy of something per host?** <br/>
There are use cases to run a copy of the application on all available hosts. For e.g. log collector, health monitor, host monitor, etc. Kubernetes provide a way to configure such applications as `daemonSet`.
5. **Where to store app configurations?** <br/>
Kubernetes `configMaps` provide a way to store non-confidential data as key-value pairs which can be consumed as env variables, command-line arguments, or as configuration files in a volume.
6. **How to manage application release process systematically?** <br/>
With Kubernetes we can specify `rollout strategy` to rollout a feature in a rolling update fashion.
7. **How to scale?** <br/>
Kubernetes allows defining `autoscaling` policies to automatically scale application up/down.
8. **How to monitor health of a container?** <br/>
Kubernetes `liveliness` and `readiness` probes are used to monitor health of the application.

### Exercises for the week 4
There are no exercises for week 4 as orchestration is not covered as part of the program. Feel free to go through following references to understand more about orchestration frameworks.

### References