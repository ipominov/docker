FROM debian:bullseye

RUN apt-get update -y && apt-get install openvpn easy-rsa tini bridge-utils -y

COPY bootstrap.sh /usr/local/bin

EXPOSE 1194/tcp 1194/udp

ENTRYPOINT [ "/usr/bin/tini", "--", "bootstrap.sh" ]