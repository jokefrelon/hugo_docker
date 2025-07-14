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

在进入容器内部以后，你的文章需要放在 `content` 下的 `post` 这个文件夹📂内部

## site


可以使用 `site slug` 来快速新建文章，slug是网页浏览路径需要唯一，不能和别的文章重复。


## cate

使用 `cate categories` 来创建categories标签，然后categories的图片可以用svg、png、jpg等，但是还是建议用svg。


## ExampleSite

[JokemeBlog](https://blog.aley.cc)


## Thanks（￣︶￣）↗　

[hugo](https://github.com/gohugoio/hugo)

[hugo-theme-stack](https://github.com/CaiJimmy/hugo-theme-stack)

