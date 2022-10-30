FROM ubuntu:20.04

ENV VERSION 0.83.1 
ENV	THEME_VERSION v3.16.0 
ENV	TV 3.16.0

COPY sources.list /etc/apt/ 
COPY svg.zip /root/
WORKDIR /root
RUN export LANG=C.UTF-8 \
	&& apt update \
    	&& echo "Asia\nShanghai" | apt-get install -y tzdata \
	&& apt -y install wget git nano unzip zsh curl ncdu \
	&& wget https://ghp.jokeme.top/https://github.com/gohugoio/hugo/releases/download/v$VERSION/hugo_extended_$VERSION\_Linux-64bit.tar.gz -O hugo.tar.gz \
	&& mkdir .bin \
	&& tar -zxvf hugo.tar.gz -C /usr/local/bin \
	&& rm /usr/local/bin/LICENSE /usr/local/bin/README.md \
	&& hugo new site pblog
WORKDIR /root/pblog
RUN wget https://ghp.jokeme.top/https://github.com/CaiJimmy/hugo-theme-stack/archive/refs/tags/$THEME_VERSION.tar.gz -O themes/$THEME_VERSION.tar.gz \
	&& tar -zxf themes/$THEME_VERSION.tar.gz -C themes/ \ 
	&& mv themes/hugo-theme-stack-$TV  themes/hugo-theme-stack \
	&& rm themes/$THEME_VERSION.tar.gz \
	&& cp -r themes/hugo-theme-stack/exampleSite/* ./ \
	&& rm LICENSE README.md config.toml config.yaml \
	&& rm -rf  \
	&& unzip ../svg.zip -d static/ \
	&& mkdir assets \
	&& rm -rf content/post/chinese-test content/post/emoji-support content/post/joker content/post/markdown-syntax content/post/rich-content \
	&& rm -rf content/post/math-typesetting content/post/placeholder-text \
	&& rm -rf content/categories/* \
	&& echo "\033[49;32mGood luck!\033[0m"
COPY author.jpg /root/pblog/assets/
COPY config.yaml /root/pblog/
COPY cate site /usr/local/bin/
CMD ["hugo","server","-p","1313","--bind","'0.0.0.0'"]
