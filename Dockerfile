#
# Dockerfile for Debian + Play Framework

FROM sismics/debian-java:8.102.1
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

# Download and install Play Framework
ENV PLAY_VERSION 1.4.2
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install python
RUN wget -nv -O /opt/play-${PLAY_VERSION}.zip http://downloads.typesafe.com/play/${PLAY_VERSION}/play-${PLAY_VERSION}.zip \
    && cd /opt \
    && unzip /opt/play-${PLAY_VERSION}.zip \
    && rm play-${PLAY_VERSION}.zip \
    && mkdir /opt/play-app
WORKDIR /opt/play-app

# Expose the Play ports
EXPOSE 8000 9000
ENV PATH /opt/play-${PLAY_VERSION}:$PATH

# Set the default command to run when starting the container
CMD ["play", "run"]
