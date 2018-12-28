#!/bin/sh

docker build -t mydevacr.azurecr.io/dev/balerion:latest .
#docker run -it --name=balerion mydevacr.azurecr.io/dev/balerion:latest