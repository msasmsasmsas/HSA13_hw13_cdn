#      HSA13_hw13_cdn




## > docker exec client-europe dig carpic.com  # Повинен вернути IP europe балансувальника (10.30.0.10)




; <<>> DiG 9.18.30-0ubuntu0.24.04.2-Ubuntu <<>> carpic.com

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18399

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1


;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: fc9d24be20b71d430100000067c4d3f93df3da8687e53eee (good)

;; QUESTION SECTION:


;; ANSWER SECTION:

carpic.com.             300     IN      A       10.30.0.10


;; Query time: 0 msec

;; SERVER: 127.0.0.11#53(127.0.0.11) (UDP)

;; WHEN: Sun Mar 02 21:56:09 UTC 2025

;; MSG SIZE  rcvd: 83




## > docker exec client-europe curl -I carpic.com/1.jpg  # В заголовках повинен быти x-load-balancer: lb-america



  % Total    % Received % Xferd  Average   Speed   Time    Time     Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
                                 
  0  107k    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  
content-length: 110497

last-modified: Sun, 02 Mar 2025 20:10:50 GMT

etag: "67c4bb4a-1afa1"

accept-ranges: bytes

x-load-balancer: lb-europe



## > docker exec client-world dig carpic.com  # Повинен вернути IP word балансувальника  (10.30.0.11)


; <<>> DiG 9.18.30-0ubuntu0.24.04.2-Ubuntu <<>> carpic.com

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 34384

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1


;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: fb26e40916b9a3240100000067c4d3f95057b59ad34162d3 (good)

;; QUESTION SECTION:


;; ANSWER SECTION:

carpic.com.             300     IN      A       10.30.0.11


;; Query time: 0 msec

;; SERVER: 127.0.0.11#53(127.0.0.11) (UDP)

;; WHEN: Sun Mar 02 21:56:09 UTC 2025

;; MSG SIZE  rcvd: 83





## > docker exec client-world curl -I carpic.com/1.jpg  # В заголовках повинен быти x-load-balancer: lb-world



  % Total    % Received % Xferd  Average   Speed   Time    Time     Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
                                 
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0HTTP/1.1 200 OK
  
content-length: 110497

last-modified: Sun, 02 Mar 2025 20:10:50 GMT

etag: "67c4bb4a-1afa1"

accept-ranges: bytes

x-load-balancer: lb-world


  0  107k    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  


  

##> docker exec -it client-world siege -v -t5S -f /data/image-urls



New configuration template added to /root/.siege

Run siege -C to view the current settings in that file


{       "transactions":                         7195,

        "availability":                       100.00,
        
        "elapsed_time":                         4.02,
        
        "throughput":                         186.29,
        
        "concurrency":                         23.39,
        
        "successful_transactions":              7196,
        
        "failed_transactions":                     0,
        
        "longest_transaction":                  0.09,
        
        "shortest_transaction":                 0.00
        
}



## > docker exec -it client-europe siege -v -t5S -f /data/image-urls



New configuration template added to /root/.siege

Run siege -C to view the current settings in that file


{       "transactions":                         5105,

        "availability":                       100.00,
        
        "elapsed_time":                         4.89,
        
        "data_transferred":                   531.51,
        
        "response_time":                        0.02,
        
        "transaction_rate":                  1043.97,
        
        "throughput":                         108.69,
        
        "concurrency":                         23.69,
        
        "successful_transactions":              5107,
        
        "failed_transactions":                     0,
        
        "longest_transaction":                  0.17,
        
        "shortest_transaction":                 0.00
        
}


## > docker exec -it client-europe wrk -c1000 -t10 -d5s http://carpic.com/1.jpg

Running 5s test @ http://carpic.com/1.jpg

  10 threads and 1000 connections
  
  Thread Stats      Avg        Stdev       Max   +/- Stdev
  
    Latency       459.73ms    183.80ms    1.49s    88.61%
    
    Req/Sec       225.17      106.45      700.00     72.33%
    
  10427 requests in 5.10s, 1.12GB read
  
Requests/sec:   2044.85

Transfer/sec:    224.96MB




