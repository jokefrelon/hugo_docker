FROM ubuntu:20.04
ENV VERSION 0.83.1
ENV THEME_VERSION v2.3.0
COPY sources.list /etc/apt/ 
WORKDIR /root
RUN export LANG=C.UTF-8 \
	&& apt update \
    && export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && echo -e "tzdata tzdata/Areas select Asia\ntzdata tzdata/Zones/Asia select Shanghai" > pre.txt \
    && debconf-set-selections pre.txt \
	&& apt -y install wget git nano \
	&& wget https://github.com/gohugoio/hugo/releases/download/v$VERSION/hugo_$VERSION\_Linux-64bit.tar.gz -O hugo.tar.gz \
	&& mkdir .bin \
	&& tar -zxvf hugo.tar.gz -C /usr/local/bin \
	&& rm /usr/local/bin/LICENSE /usr/local/bin/README.md \
	&& hugo new site pblog
WORKDIR /root/pblog
RUN wget https://github.com/CaiJimmy/hugo-theme-stack/archive/refs/tags/$THEME_VERSION.tar.gz -O themes/$THEME_VERSION.tar.gz \
	&& tar -zxvf themes/$THEME_VERSION.tar.gz -C themes/ \ 
	&& mv themes/hugo* themes/hugo-theme-stack \
	&& rm themes/$THEME_VERSION.tar.gz \
	&& cp -r themes/hugo-theme-stack/exampleSite/* ./ \
	&& rm LICENSE README.md \
	&& echo 'ignoreErrors: "error-remote-getjson"' >> config.yaml \
	&& rm config.toml \
	&& rm content/post/rich-content/index.md \
	&& echo "\033[49;32mGood luck!\033[0m"
CMD ["hugo","server","-p","1313","--bind","'0.0.0.0'"]
