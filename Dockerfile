# Electerm Builder Docker Image
# Ubuntu 18.04 with Python 3.8, Node.js 16, and GCC 8

FROM ubuntu:18.04

ARG BUILD_DATE
LABEL build-date=$BUILD_DATE
LABEL maintainer="ZHAO Xudong <zxdong@gmail.com>"
LABEL description="This is Docker image for building legacy electerm for old linux systems"
LABEL url="https://github.com/electerm/electerm-builder-docker"
LABEL vendor="electerm"
LABEL version="1.0.1"
LABEL org.opencontainers.image.title="electerm-builder-legacy"
LABEL org.opencontainers.image.description="Ubuntu 18.04 with Python 3.8, Node.js 16, and GCC 8 for building legacy electerm"
LABEL org.opencontainers.image.url="https://github.com/electerm/electerm-builder-docker"
LABEL org.opencontainers.image.source="https://github.com/electerm/electerm-builder-docker"
LABEL org.opencontainers.image.vendor="electerm"
LABEL org.opencontainers.image.version="1.0.1"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_VERSION=3.8
ENV NODE_VERSION=16

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    curl \
    gnupg \
    lsb-release \
    git \
    && rm -rf /var/lib/apt/lists/*

# Add NodeSource repository and install Node.js 16
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Install Python 3.8
RUN add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update \
    && apt-get install -y \
        python3.8 \
        python3.8-dev \
        python3.8-distutils \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.8 as default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

# Install GCC 8
RUN apt-get update && apt-get install -y \
    gcc-8 \
    g++-8 \
    && rm -rf /var/lib/apt/lists/*

# Set GCC 8 as default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100

# Install build dependencies for electerm
RUN apt-get update && apt-get install -y \
    build-essential \
    libnss3-dev \
    libsecret-1-dev \
    fakeroot \
    rpm \
    libgtk-3-0 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    libatspi2.0-0 \
    libuuid1 \
    libsecret-1-0 \
    libappindicator3-1 \
    ruby-full \
    libgconf-2-4 \
    libxrandr2 \
    libasound2 \
    libpangocairo-1.0-0 \
    libatk1.0-0 \
    libcairo-gobject2 \
    libgtk-3-0 \
    libgdk-pixbuf2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install FPM (for package building)
RUN gem install fpm

# Install yarn globally
RUN npm install -g yarn

# Set working directory
WORKDIR /workspace

# Set default command
CMD ["/bin/bash"]
