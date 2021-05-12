# Hugo_docker

This repo can help you build your own Hugo site quickly.

## How to use ?

First of all ! u should clone this repo.

```
git clone https://github.com/jokefrelon/hugo_docker.git
```
Because it provide the Dockerfile,so u need install docker on ur machine to build the image.

Then start docker build

```
cd hugo_docker
docker build -t hugo .
```
But when u run the container,it will report an error,the port have been used.

So u need run with command : `hugo server -p 1313 --bind "0.0.0.0"`

I'll fix it recently.

You can enter the following command to test.
```
docker run -it --rm --name hugo -p 1313:1313 hugo hugo server -p 1313 --bind "0.0.0.0"
```

## Thanks（￣︶￣）↗　

[hugo](https://github.com/gohugoio/hugo)

[hugo-theme-stack](https://github.com/CaiJimmy/hugo-theme-stack)

