
### Docker run example

docker run --name loadbalancer -e ETCD_ENDPOINT="https://$(ifconfig docker0 | grep 'inet ' | awk '{ print $2}'):4001" -p ${COREOS_PUBLIC_IPV4}:80:80 -p ${COREOS_PUBLIC_IPV4}:443:443 salamandra/haproxy


docker run --name loadbalancer -e ETCD_ENDPOINT="https://$(cat /etc/environment | grep COREOS_PUBLIC_IPV4 | awk -F "=" '{print $2}'):4001" -p $(cat /etc/environment | grep COREOS_PUBLIC_IPV4 | awk -F "=" '{print $2}'):80:80 -p $(cat /etc/environment | grep COREOS_PUBLIC_IPV4 | awk -F "=" '{print $2}'):443:443 salamandra/haproxy
