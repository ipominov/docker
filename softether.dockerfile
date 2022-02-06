FROM centos:7 as base 
RUN yum install -y git readline-devel openssl-devel make gcc && yum update -y 
RUN git clone --depth=1 https://github.com/SoftEtherVPN/SoftEtherVPN_Stable.git /opt/softether 
WORKDIR /opt/softether 
RUN ./configure 
RUN make

FROM centos:7 
WORKDIR /opt/softether 
COPY --from=base /opt/softether/bin/vpnserver/* /opt/softether/
EXPOSE 443/tcp 5555/tcp 
CMD ["/opt/softether/vpnserver", "execsvc"]
