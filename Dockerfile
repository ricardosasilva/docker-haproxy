FROM salamandra/confd

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:vbernat/haproxy-1.5 -y
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq haproxy

RUN mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original
ADD haproxy/haproxy.conf /etc/haproxy/haproxy.conf
ADD supervisor/conf.d/haproxy.conf /etc/supervisor/conf.d/

VOLUME ["/etc/haproxy/",]

# Expose ports.
EXPOSE 80
EXPOSE 443