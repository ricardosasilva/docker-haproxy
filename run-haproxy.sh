#!/bin/sh

# Wait for rsyslog start
sleep 4
/usr/sbin/haproxy -f /etc/haproxy/haproxy.conf -n 4096 -N 4096