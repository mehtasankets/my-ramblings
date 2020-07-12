---
title: "Mentoring Docker: Week 3"
date: 2018-10-01T15:25:19+02:00
publishdate: 2018-10-07T11:17:14+02:00
lastmod: 2018-10-08T18:55:29+02:00
tags: ["arcesium", "exl", "docker", "week 3"]
type: "post"
comments: true
---

Welcome to 3rd blog post on mentoring docker. Focus for this week to understand Docker Volumes and Docker-compose.

### Focus points for the week 3

#### 1. How to run multiple copies of your application? What are the challenges you see with this?
This is a continuation from the last 2 exercises given in week 2. The intention here was to understand the challenges one may face while running multiple copies of the same application.
1. How to deal with port bindings while running multiple copies from the same node / host? 
One need to understand the difference between EXPOSE instruction vs -p vs -P parameters to correctly deal with port bindings. Putting extract from [this](https://stackoverflow.com/a/22150099/1074336) stack-overflow answer which explains the difference clearly: 
	* If you specify neither EXPOSE nor -p, the service in the container will only be accessible from inside the container itself.
	* If you EXPOSE a port, the service in the container is not accessible from outside Docker, but from inside other Docker containers. So this is good for inter-container communication.
	* If you EXPOSE and -p a port, the service in the container is accessible from anywhere, even outside Docker.
	* If you use -p without EXPOSE, docker does an implicit EXPOSE and the behavior is same as above.
	* -P / --publish-all is used to Publish all exposed ports to random ports > 32767 on host automatically. This helps resolve port conflict issues and one should use this over -p to avoid any port binding conflicts.

2. How to share data between multiple copies?
Using [volume mounts](https://docs.docker.com/storage/) which are shared between containers is the solution here:
	* **Volume mount:** Managed by docker, support for volume drivers to store data remotely, manged using docker commands
	* **Bind mount:** Managed by host file system, security vulnerability as host files can be changed
	* **tmpfs mount:** In memory non-persistent store, fast, quick access

#### 2. How to combine multiple containers into a single deployable unit?
1. Why do we need such functionality? <br/>
Usually an application is made up of multiple components like database, queues, caches, web services, etc. Deploying an application means deploying all these components. Thus, there's a need to manage and deploy multiple containers together.
2. Where to use such functionality? <br/>
Having such a feature allows quick deployment of the complete application in an isolated environment. Another prominent use case is to use this in CI environment, where the build job would create -> run tests -> destroy all the containers together.
3. How to achieve it? <br/>
[Docker-compose](https://docs.docker.com/compose/) allows you to bundle multiple containers into a single deployable unit. Understand the docker-compose yaml configuration file and also the docker-compose commands like `start`, `stop`, `scale`, `events`, `pause`, `unpause` etc.
	* `docker-compose up --scale` is a beautiful command which allows user to quickly up / down scale the application ([Ref.](https://docs.docker.com/compose/reference/scale/)). Another way to scale a service is available with [docker-swarm](https://docs.docker.com/engine/swarm/swarm-tutorial/scale-service/) but docker-swarm is not covered as part of this program.
	* `docker-compose events` is another beautiful command which listens to all the docker events and allows user to act on them if necessary ([Ref.](https://docs.docker.com/compose/reference/events/)).

### Exercises for the week 3
* Run multiple Ubuntu containers with same volume and share a file over a volume
* Use volume with Jenkins to avoid installing plugins with every run
* Create a docker-compose file to create a multi-container application. Use web-service along with Redis cache to demonstrate this