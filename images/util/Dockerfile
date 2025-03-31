FROM alpine:latest

RUN apk add pv

COPY scripts/dvbr_backup /usr/local/bin/dvbr_backup
RUN chmod +x /usr/local/bin/dvbr_backup

WORKDIR /data

ENTRYPOINT ["/bin/bash"]