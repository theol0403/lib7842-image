FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:team-gcc-arm-embedded/ppa -y && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt-get install -y tzdata && \
    apt-get install -y \
        build-essential \
        fakeroot \
        g++-7 --no-install-recommends \
        git \
        make \
        cmake \
        valgrind \
        gcc-arm-embedded \
        python-all-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        sudo \
        curl \
        wget \
        libgtest-dev \
        cppcheck \
        gcc-9 --no-install-recommends \
        g++-9 \
        lcov \
        libsdl2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install jinja2 pygments wheel
RUN pip3 install https://github.com/purduesigbots/pros-cli/releases/download/3.1.4/pros_cli_v5-3.1.4-py3-none-any.whl

RUN cd /usr/src/gtest && \
    sudo cmake . && \
    sudo make && \
    sudo cp *.a /usr/lib/

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /
