FROM ubuntu:18.04
LABEL Name=android_build Version=0.0.1

# 添加自定义源
ADD sources.list /etc/apt/sources.list

# 自动化安装
ENV DEBIAN_FRONTEND=noninteractive

# 安装依赖
RUN apt-get update -y
RUN apt-get install -y vim openjdk-8-jdk python git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip

# Repo
RUN mkdir ~/bin
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
RUN chmod a+x ~/bin/repo
RUN echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

