FROM debian

RUN apt update -y
RUN apt install -y mpd mpc

EXPOSE 6600

COPY mpd.conf /etc/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENV ICECAST_NAME ""
ENV ICECAST_SERVER ""
ENV ICECAST_PORT ""
ENV ICECAST_PASSWORD ""
ENV ICECAST_MOUNT ""

CMD ["/entrypoint.sh"]
