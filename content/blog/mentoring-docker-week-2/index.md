---
title: "Mentoring Docker: Week 2"
date: 2018-10-01T15:25:19+02:00
publishdate: 2018-10-07T11:17:14+02:00
lastmod: 2018-10-08T18:55:29+02:00
tags: ["arcesium", "exl", "docker", "week 2"]
type: "post"
comments: true
---

Welcome to 2nd blog post on mentoring docker. Focus for this week was to understand Dockerfile and Docker images and Docker hub.

### Focus points for the week 2

#### 1. How to create a docker image?
Now that we have realized the benefits of having a docker image, it's time to understand [Dockerfile](https://docs.docker.com/engine/reference/builder/) which helps us create an image for the application. Apart from understanding the key instructions, it's essential to understand below differences:
* **RUN vs CMD vs ENTRYPOINT:** RUN build time command which allows you to add layers on top of base image where as CMD and ENTRYPOINT are the commands executed while running the container. The difference is explained in detail [here](https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/) and [here](https://stackoverflow.com/a/21564990/1074336).
* **ADD vs COPY:** ADD is kind of a superset of COPY command where both support copying files from local file system, but ADD supports extracting data directly from a tar or from a given URL ([Ref](https://nickjanetakis.com/blog/docker-tip-2-the-difference-between-copy-and-add-in-a-dockerile)).
* **Multiple FROM in same docker file:** This is a very important concept which allows creating [multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/). Usually, everything that's required to build an application is not necessarily required during run time. With single build, image becomes bulky as it contains both compile time + run time dependencies / applications. With multi-stage builds, once can easily discard build time dependency keeping final image light-weight. For e.g. we can start with a hugo / gatsby / nuxtjs image to build a static web site but then only nginx would suffice to run the same.

#### 2. How to deploy docker image? 
Process to run any docker image is similar to how we ran hello-world / jenkins image in first week. Key point to understand here is how to share the image with everyone. To share the image with everyone, create an account on https://hub.docker.com/ and push the image to docker hub. It will enable others to pull and run the image. You can find docker image for this site available at https://hub.docker.com/repository/docker/mehtasankets/my-ramblings.

### Exercises for the week 2
* Create a docker file for your web application
* Build an image for the same
* Push the image to docker hub
* Ask others to pull and run the image to understand how easy Docker makes to install any application
* Try to run multiple Ubuntu containers and share a file between between containers
* Try to run multiple Jenkins containers and share a job between between containers