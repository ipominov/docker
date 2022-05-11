FROM fedora:latest as base
RUN dnf install -y git make gcc readline-devel openssl-devel zlib-devel
RUN git clone --depth=1 https://github.com/SoftEtherVPN/SoftEtherVPN_Stable.git /opt/softether
WORKDIR /opt/softether
RUN ./configure
RUN make

FROM fedora:latest
WORKDIR /opt/softether
COPY --from=base /opt/softether/bin/vpnserver/* /usr/local/vpnserver/
EXPOSE 5555/tcp
CMD ["/usr/local/vpnserver/vpnserver", "execsvc"]
