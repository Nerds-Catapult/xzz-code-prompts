# A linux minimalist HTTP server
- Not for production use.

1. compile the `http_server.c`
```bash
gcc http_server.c
```
2. trace the syscalls
```bash
strace ./a.out
```
3. open another terminal and navigate to the `index.html` and run:
```bash
wget localhost:8080/index.html
```
- the terminal should preview:
```
$ wget localhost:8080/index.html
--2024-05-16 04:12:55--  http://localhost:8080/index.html
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:8080... connected.
HTTP request sent, awaiting response... 200 No headers, assuming HTTP/0.9
Length: unspecified
Saving to: ‘index.html.1’

index.html.1            [ <=>                ]      33  --.-KB/s    in 0s      

2024-05-16 04:12:55 (11.29 MB/s) - ‘index.html.1’ saved [33]
$
```
- the program should have received data from the `index.html` and saved it into a `index.html.1` file
```
$ cat index.html.1
Hello from the server, it works!

$
```