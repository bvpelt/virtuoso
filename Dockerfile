FROM fedora:23
MAINTAINER dockerpinguin <bart.vanpelt@gmail.com>

RUN dnf -y update && \
	dnf clean all

RUN dnf -y install \
	virtuoso-opensource \
	virtuoso-opensource-apps \
	virtuoso-opensource-utils \
	virtuoso-opensource-conductor

WORKDIR /var/lib/virtuoso/db

EXPOSE 1111 8890

COPY ./odbc.ini /etc/odbc.ini
COPY ./virtuoso.sh /

ENTRYPOINT ["/virtuoso.sh"]