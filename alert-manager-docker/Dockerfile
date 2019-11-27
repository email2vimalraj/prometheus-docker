FROM alpine:latest

RUN mkdir /usr/mware

WORKDIR /usr/mware

RUN apk update
RUN wget https://github.com/prometheus/alertmanager/releases/download/v0.19.0/alertmanager-0.19.0.linux-amd64.tar.gz
RUN tar -xvzf alertmanager-0.19.0.linux-amd64.tar.gz
RUN mv alertmanager-0.19.0.linux-amd64 alertmanager
RUN rm -rf alertmanager-0.19.0.linux-amd64.tar.gz

WORKDIR /usr/mware/alertmanager/

EXPOSE 9093

ENTRYPOINT [ "./alertmanager" ]