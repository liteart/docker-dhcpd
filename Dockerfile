FROM alpine:latest

RUN set -xe \
	&& apk add --update --no-progress dhcp \
	&& rm -rf /var/cache/apk/*

EXPOSE 67/udp 67/tcp

RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

COPY dhcpd.conf /etc/dhcp/dhcpd.conf

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]
