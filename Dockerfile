FROM ubuntu:focal

LABEL vendor=letsdone \
  maintainer="letsdone" \
  name="ubuntu focal base image" \
  build-date="2021-09-10"

ENV LANG=C.UTF-8

# CST-8 timezone
COPY Shanghai /etc/localtime

RUN echo "Asia/Shanghai" > /etc/timezone \
  && sed -i "s#http://ports.ubuntu.com#http://mirrors.tuna.tsinghua.edu.cn#g" /etc/apt/sources.list \
  && apt-get update && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends curl \
  && apt-get clean && apt-get autoclean && apt-get autoremove \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /tmp/*

CMD ["cat", "/etc/os-release"]
