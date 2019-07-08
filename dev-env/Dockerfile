FROM ubuntu:18.04
MAINTAINER Swind <swind@code-life.info>

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt update -y && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:neovim-ppa/stable && \
    apt-get update -y && \
    apt-get install -y curl git neovim python-dev python-pip python3-dev python3-pip locales tzdata && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#===================
# Set locale
#===================
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 

#===================
# Timezone settings
# Possible alternative: https://github.com/docker/docker/issues/3359#issuecomment-32150214
#===================
ENV TZ "UTC"
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata

#===================
# Install neovim python package 
#===================

RUN pip3 install --upgrade pynvim 
