FROM salamandra/confd

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:vbernat/haproxy-1.5 -y
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq haproxy

RUN mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original
ADD run-haproxy.sh /usr/local/bin/
ADD haproxy/haproxy.initial.conf /etc/haproxy/haproxy.conf
ADD rsyslog.d/ /etc/rsyslog.d/
ADD supervisor/conf.d/ /etc/supervisor/conf.d/
ADD confd /etc/confd

#VOLUME ["data",]

# Expose ports.
EXPOSE 80
EXPOSE 443