# nfdump

nfdump tools packaged in a docker container.  Application  source code can be found [here](https://github.com/phaag/nfdump/)


# Build Image

```sh
./build.sh 
```

If you wish to override the version simply pass the version as an argument

```sh
./build.sh 1.6.17
```

The image created will be netsage/nfdump-collector:1.6.17

# Docker-compose / Stack setup.

You can override the command executed by simply adding your own command line.

available commands are:

 - nfanon
 - nfcapd
 - nfdump
 - nfexpire
 - nfreplay
 - sfcapd

Default command is:  

```sh 
nfcapd -T all -l /data -S 1 -w -z -p 9999
```



```yaml
version: '3.7'
services:
  collector:
      image: netsage/nfdump-collector:1.6.18
      command: /usr/local/bin/nfcapd -T all -l /data -S 1 -w -z -p 9999
      ports:
        - "9999:9999/udp"
      restart: always
      volumes:
         - ./data/input_data:/data
```



