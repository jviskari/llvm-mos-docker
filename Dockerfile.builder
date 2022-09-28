FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y build-essential xz-utils git ninja-build

RUN apt install -y wget
ARG CMAKE_VERSION=3.23.2

RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"

