---
title: "Mentoring Docker: Week 1"
date: 2018-10-01T15:25:19+02:00
publishdate: 2018-10-07T11:17:14+02:00
lastmod: 2018-10-08T18:55:29+02:00
tags: ["arcesium", "exl", "docker", "week 1"]
type: "post"
comments: true
---

**Arc-EXL** is a program initiated in Arcesium which focuses on Experiential Learning i.e. learning through experience. I signed up to mentor a group of 3 mentees on [**Docker**](https://www.docker.com/) technology. Idea here was to provide few scenarios to encourage mentees to learn the technology through reflection on implementing a solution for the same.

We kept the structure of the program very simple. Every week, we met on Monday to discuss the progress made in earlier week and to discuss focus points (problem statements) for the week. Mentees were expected to come up with solutions on how to deal with these problem statements. We then regroup on Fridays to discuss the solutions, mold it into Docker and set an exercise to implement the same over the weekend.

### Pre-requisites for the program
  * Have an access to a *Linux based OS* (Ubuntu / Fedora / Alpine): You can duel-boot your machine or have a virtual machine setup or have WSL (WSL version 2 to be specific) installed over windows or have an instance in some cloud (EC2 on AWS / VM instance on GCP)
  * Setup a small *web-service project*: Project can be a Python web-service or Node JS project or a micro-service using [Quarkus](https://quarkus.io/) or [Spring-Boot](https://spring.io/projects/spring-boot) or [Micronaut](https://micronaut.io/).

### Focus points for the week 1

#### 1. How do cloud platforms maintain resource boundaries for the machines / applications being used by different companies?
Intention here was to understand difference between a dedicated server, a virtual machine and a container and to understand the scenarios where containerization make sense.
* Dedicated server: Higher cost, difficult to scale as resources are constant
* VM: Provides hardware level isolation using hypervisors, scaling takes time as boot times are higher
* Container: OS level virtualization, good for applications, low latency, lightweight, scaling is very fast<br/>
Tradeoff: Containers don’t do true virtualization, you can’t run a windows container on a Linux host as containers are Kernel dependent. They rely on host OS kernel for hardware interaction. <br/>
A good analogy for VM vs Containers: Stand-alone houses (completely isolated) vs Apartments (shared plumbing, electricity, security, etc.)

#### 2. How to make sure that the application you wrote works fine on friend's computer or works in production environment?
Intention here was to understand compatibility issues which will help understand the power of Docker.
* README file with instructions
  * What if someone miss to run a command?
* Shell script to run all the instructions in README
  * What if something's already installed?
  * What if some library is already available with different version?
* Shell script which uninstalls and installs everything with correct versions
  * What if some other program has conflicting requirements?
  * What if OS version is different (Ubuntu 16.04 vs Ubuntu 18.04)?
  * What if OS itself is different?
  * What if port required by the program is being used by other program?

### Exercises for the week 1
* [Install docker](https://docs.docker.com/engine/install/ubuntu/)
* Run [hello-world image](https://docs.docker.com/get-started/)
* Run [jenkins image](https://hub.docker.com/_/jenkins/)
* Read about VM vs Containerization: Come up with one scenario where you'll use VM and another scenario where you'll use containerization.
* Create a git repo, commit your application code and document your understandings and/or references