FROM ubuntu:20.04
ENV VERSION 0.83.1
COPY sources.list /etc/apt/ 
RUN export LANG=C.UTF-8 \
	&& apt update \
    && export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && echo -e "tzdata tzdata/Areas select Asia\ntzdata tzdata/Zones/Asia select Shanghai" > /root/pre.txt \
    && debconf-set-selections /root/pre.txt \
	&& apt -y install wget git nano \
	&& wget https://github.com/gohugoio/hugo/releases/download/v$VERSION/hugo_$VERSION\_Linux-64bit.tar.gz -O /root/hugo.tar.gz \
	&& mkdir /root/.bin \
	&& tar -zxvf /root/hugo.tar.gz -C /usr/local/bin \
	&& rm /usr/local/bin/LICENSE /usr/local/bin/README.md 
WORKDIR /root
RUN hugo new site pblog
WORKDIR /root/pblog
RUN git clone https://github.com/CaiJimmy/hugo-theme-stack themes/hugo-theme-stack \
	&& cp -r themes/hugo-theme-stack/exampleSite/* ./ \
	&& rm LICENSE README.md \
	&& echo 'ignoreErrors: "error-remote-getjson"' >> config.yaml \
	&& rm config.toml 
CMD ["hugo","server","-p","1313","--bind","'0.0.0.0'"]
