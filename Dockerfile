FROM ubuntu:16.04

RUN apt-get update \
	&& apt-get install -y \
		curl \
		bzip2 \
		libfreetype6 \
		libgl1-mesa-dev \
		libglu1-mesa \
		libxrender1 \
		libxi6 \
		ca-certificates \
		unzip \
    xz-utils \
    python3-pip \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

ENV BLENDER_MAJOR 2.82
ENV BLENDER_VERSION 2.82
ENV BLENDER_BZ2_URL http://download.blender.org/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux64.tar.xz

RUN mkdir /usr/local/blender \
	&& curl -SL "$BLENDER_BZ2_URL" -o blender.tar.xz \
	&& unxz blender.tar.xz && tar -xvf blender.tar -C /usr/local/blender --strip-components=1 \
	&& rm blender.tar

VOLUME ["/scripts","/data"]
