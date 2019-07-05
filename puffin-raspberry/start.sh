#!/bin/sh

xhost +local:docker

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -it --rm \
--device=/dev/dri:/dev/dri:rw \
--group-add plugdev \
-e DISPLAY=$DISPLAY -v $(pwd):/home/tester -v $XSOCK:$XSOCK -v $X \
AUTH:$XAUTH -e XAUTHORITY=$XAUTH swind/raspberry-box /bin/bash

xhost -local:docker
