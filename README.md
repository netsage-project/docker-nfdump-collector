# docker-nfdump

nfdump (with NSEL enabled) in a container


# Build Image

```sh
./build.sh 
```

If you wish to override the version simply pass the version as an argument

```sh
./build.sh 1.6.18
```

The image created will be netsage/nfdump-collector:1.6.18

# Docker-compose / Stack setup.

```yaml
version: '3.7'
services:
  collector:
      image: netsage/nfdump-collector:1.6.18-centos-8
      restart: always
      volumes:
         - ./data/input_data:/data
      network_mode: host
      command: optional override
```

Default command is:  

```bash 
nfcapd -T all -l /data -S 1 -w -z -p 9999
```

You can override the command executed by simply adding your own cmd:
