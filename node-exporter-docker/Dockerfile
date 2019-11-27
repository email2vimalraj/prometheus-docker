FROM alpine:latest

RUN mkdir /usr/mware

WORKDIR /usr/mware

RUN apk update
RUN wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
RUN tar -xvzf node_exporter-0.18.1.linux-amd64.tar.gz
RUN mv node_exporter-0.18.1.linux-amd64 node_exporter
RUN rm -rf node_exporter-0.18.1.linux-amd64.tar.gz

WORKDIR /usr/mware/node_exporter/

EXPOSE 9100

ENTRYPOINT [ "./node_exporter" ]