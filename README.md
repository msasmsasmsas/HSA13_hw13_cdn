# HSA13_hw13_sdn


(.venv) PS E:\HSA13\HSA13_hw13_cdn> docker exec client-europe dig carpic.com  # овинен вернути IP europe балансувальника (10.30.0.10)

; <<>> DiG 9.18.30-0ubuntu0.24.04.2-Ubuntu <<>> carpic.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 22739
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: bc8d61840dbedbe60100000067c4cfc5853aff96e90d3d0c (good)
;; QUESTION SECTION:

;; ANSWER SECTION:
carpic.com.             300     IN      A       10.30.0.10

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11) (UDP)
;; WHEN: Sun Mar 02 21:38:13 UTC 2025
;; MSG SIZE  rcvd: 83

(.venv) PS E:\HSA13\HSA13_hw13_cdn> docker exec client-europe curl -I carpic.com/1.jpg  #  заголовках повинен быти x-load-balancer: lb-america
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0  107k    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
content-length: 110497
last-modified: Sun, 02 Mar 2025 20:10:50 GMT
etag: "67c4bb4a-1afa1"
accept-ranges: bytes
x-load-balancer: lb-europe

(.venv) PS E:\HSA13\HSA13_hw13_cdn>
(.venv) PS E:\HSA13\HSA13_hw13_cdn>
(.venv) PS E:\HSA13\HSA13_hw13_cdn>
(.venv) PS E:\HSA13\HSA13_hw13_cdn> docker exec client-world dig carpic.com  # овинен вернути IP word балансувальника  (10.30.0.11)

; <<>> DiG 9.18.30-0ubuntu0.24.04.2-Ubuntu <<>> carpic.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 20032
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: f137acd500f982000100000067c4cfc56197cf17a34438bf (good)
;; QUESTION SECTION:

;; ANSWER SECTION:
carpic.com.             300     IN      A       10.30.0.11

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11) (UDP)
;; WHEN: Sun Mar 02 21:38:13 UTC 2025
;; MSG SIZE  rcvd: 83

(.venv) PS E:\HSA13\HSA13_hw13_cdn> docker exec client-world curl -I carpic.com/1.jpg  #  заголовках повинен быти x-load-balancer: lb-world
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0  107k    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
server: nginx/1.27.4
date: Sun, 02 Mar 2025 21:38:17 GMT
content-type: image/jpeg
content-length: 110497
last-modified: Sun, 02 Mar 2025 20:10:50 GMT
etag: "67c4bb4a-1afa1"
accept-ranges: bytes
x-load-balancer: lb-world

