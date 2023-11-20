#
# Dockerfile for Debian + Play Framework

FROM sismics/debian-java:17.0.9
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

# Download and install Play Framework
ENV PLAY_VERSION 1.7.1
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install python3 && rm -rf /var/lib/apt/lists/*
RUN wget -nv -O /opt/play-${PLAY_VERSION}.zip https://github.com/playframework/play1/releases/download/${PLAY_VERSION}/play-${PLAY_VERSION}.zip \
    && cd /opt \
    && unzip /opt/play-${PLAY_VERSION}.zip \
    && chmod +x /opt/play-${PLAY_VERSION}/play \
    && rm play-${PLAY_VERSION}.zip \
    && mkdir /opt/play-app
WORKDIR /opt/play-app

# Expose the Play ports
EXPOSE 8000 9000
ENV PATH /opt/play-${PLAY_VERSION}:$PATH

# Set the default command to run when starting the container
CMD ["play", "run"]
