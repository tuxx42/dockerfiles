mininet
=======


This dockerfile builds a mininet environment including wireshark/tcpdump and openvswitch/-controller


```bash
$ sudo docker run -it --net host --rm --privileged -e DISPLAY \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v /lib/modules:/lib/modules \
             mininet:latest bash
```