
### Docker run example

docker run --name loadbalancer -e ETCD_ENDPOINT="$(ifconfig docker0 | grep 'inet ' | awk '{ print $2}'):4001" -p ${COREOS_PUBLIC_IPV4}:80:80 -p ${COREOS_PUBLIC_IPV4}:443:443 salamandra/haproxy