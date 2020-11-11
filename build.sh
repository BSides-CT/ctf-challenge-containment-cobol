#!/bin/bash
docker build --tag containmentunit:1.0 . --build-arg ENV=CTF
docker run -it -p 23:23 -p 21:21 -p 20:20 -p 10090-10100:10090-10100 containmentunit:1.0
