# my-ramblings

A static site to ramble about my learnings

## One time setup
Ref: https://gohugo.io/getting-started/quick-start/
* Install Homebrew: https://docs.brew.sh/Homebrew-on-Linux
* Install Hugo: `brew install hugo`

## Local instance
* Run hugo server: `hugo server -D`

## Build static pages
* Generate static pages under `./public/` directory: `hugo -D`

## Create a new page
* Create a page using hugo command: `hugo new post/my-new-page-heading.md`

## Try out docker containerization
https://www.linode.com/docs/kubernetes/deploy-container-image-to-kubernetes/#build-the-docker-image

## Clould instance setup
* `sudo docker ps`
* Remove earlier docker image: `sudo docker stop <INSTANCE_NAME>`
* Restart with new image: `sudo docker run -d -p 9090:80 mehtasankets/my-ramblings:<VERSION>`
