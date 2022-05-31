# This defines a custom space for the itopia DevRel & Product teams
# to develop & maintain Xpra-related layers of itopia Spaces.
# See https://github.com/Xpra-org/xpra
# and https://github.com/selkies-project/selkies-xpra
# and https://github.com/Xpra-org/xpra-html5
# and https://github.com/selkies-project/xpra-html5

# syntax=docker/dockerfile:1
FROM ghcr.io/itopia-inc/spaces-images/spaces-ubuntu-nodejs-vscode:focal-18

# Install Xpra server dependencies for Ubuntu 20.04
RUN sudo apt-get update && sudo apt-get install -y \
  cython3 \
  libgtk-3-dev \
  libsystemd-dev \
  libx11-dev \
  libxcomposite-dev \
  libxdamage-dev \
  libxkbfile-dev \
  libxres-dev \
  libxtst-dev \
  pandoc \
  pkg-config \
  python-all-dev \
  python-gi-dev \
  python3-cairo-dev \
  python3-dev \
  python3-gi-cairo \
  python3-opengl \
  python3-pil \
  python3-rencode \
  python3-lz4 \
  x11-xkb-utils \
  xauth \
  xvfb

# Install Xpra server
RUN sudo mkdir -p /etc/xpra-dev && \
  cd /etc/xpra-dev && \
  sudo git clone -b v4.3.3 --single-branch https://github.com/Xpra-org/xpra && \
  cd xpra && \
  sudo ./setup.py install

# Install Xpra HTML5 client dependencies for Ubuntu 20.04
RUN sudo apt-get update && sudo apt-get install -y \
  brotli \
  gnome-backgrounds \
  libjs-jquery \
  libjs-jquery-ui \
  uglifyjs

# Install Xpra HTML5 client
RUN sudo mkdir -p /etc/xpra-dev && \
  cd /etc/xpra-dev && \
  sudo git clone -b v5.0 --single-branch https://github.com/Xpra-org/xpra-html5 && \
  cd xpra-html5 && \
  sudo ./setup.py install
