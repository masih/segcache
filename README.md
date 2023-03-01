# Pelikan Segcache Container

This repository offers a minimal container to run [Pelikan Segcache](https://github.com/pelikan-io/pelikan).
By default the container is started using the default configuration.

## Usage

To start up the container with default configuration run:
```shell
docker run ghcr.io/masih/segcache:latest
```

This will start up a segcache instance accessible on port `12321` with admin server on port `9999`.
To stop the running container press `Ctrl + C`.

To see the full default configuration, run:
```shell
docker run ghcr.io/masih/segcache:latest --config
```

You should see the following output:

```text
Segcache configuration:

daemonize = false
dlog_interval = 500

[admin]
host = "127.0.0.1"
port = "9999"
http_enabled = false
http_host = "127.0.0.1"
http_port = "9998"
timeout = 100
nevent = 1024
tw_tick = 10
tw_cap = 1000
tw_ntick = 100
use_tls = false

[server]
host = "0.0.0.0"
port = "12321"
timeout = 100
nevent = 1024

[worker]
timeout = 100
nevent = 1024
threads = 1

[time]
time_type = "Memcache"

[tls]

[seg]
hash_power = 16
overflow_factor = 1.0
heap_size = 67108864
segment_size = 1048576
eviction = "Merge"
merge_target = 4
merge_max = 8
compact_target = 2

[buf]
size = 16384
poolsize = 0

[debug]
log_level = "info"
log_max_size = 1073741824
log_queue_depth = 4096
log_single_message_size = 1024

[klog]
interval = 100
max_size = 1073741824
queue_depth = 4096
sample = 100
single_message_size = 1024

[sockio]
buf_sock_poolsize = 0

[tcp]
backlog = 128
poolsize = 0
```

For the list of full options, run:
```shell
docker run ghcr.io/masih/segcache:latest --help
```