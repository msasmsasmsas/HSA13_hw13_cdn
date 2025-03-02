for strategy in leastconn roundrobin random; do
    echo "Testing $strategy strategy"
    sed -i "s/balance .*/balance $strategy/" haproxy.cfg
    docker restart lb-america
    sleep 3
    docker exec -it client-america wrk -c1000 -t10 -d5s http://mypic.com/1.jpg
done