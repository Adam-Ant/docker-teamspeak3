#To Run: docker run --name ts-dev -p $IP:9987:9987/udp -p $IP:10011:10011 -p $IP:30033:30033 -v **TS DATA LOCATION**:/data ts-dev
FROM debian:wheezy
MAINTAINER Adam Dodman <adam.dodman@gmx.com>

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

#Update base
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qy

# Install software
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends libnspr4 spidermonkey-bin ca-certificates curl bzip2\
	&& curl -L -o /usr/bin/jsawk https://github.com/micha/jsawk/raw/master/jsawk \
	&& chmod +x /usr/bin/jsawk \
	&& apt-get clean \
	&& rm -rf /var/lib/apt /tmp/* /var/tmp/*

#Create Runtime Directory
RUN mkdir /opt/teamspeak && mkdir /opt/tsBase

# Add custom files
COPY start /

#CHMOD start
RUN chmod +x /start

# Start command
CMD ["/start"]
