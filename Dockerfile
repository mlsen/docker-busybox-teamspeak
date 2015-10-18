FROM progrium/busybox

RUN opkg-install wget tar bash

## Set some variables for override.
# Download Link of TS3 Server
ENV TEAMSPEAK_VERSION 3.0.11.4

VOLUME ["/teamspeak"]

RUN wget -O teamspeak3-server_linux-amd64.tar.gz http://dl.4players.de/ts/releases/${TEAMSPEAK_VERSION}/teamspeak3-server_linux-amd64-${TEAMSPEAK_VERSION}.tar.gz \
	&& tar -C /opt -xzf teamspeak3-server_linux-amd64.tar.gz \
	&& rm teamspeak3-server_linux-amd64.tar.gz

ADD /scripts/ /opt/scripts/
RUN chmod -R 774 /opt/scripts

ENTRYPOINT ["/opt/scripts/docker-ts3.sh"]

EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011
