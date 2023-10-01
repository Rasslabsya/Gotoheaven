FROM ubuntu:23.04

RUN apt-get update && apt-get install -y python3 && apt-get install traceroute


RUN echo "Hello" > file.txt


