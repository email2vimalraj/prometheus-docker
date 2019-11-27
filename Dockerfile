FROM alpine:latest

RUN mkdir /usr/mware

WORKDIR /usr/mware

RUN apk update
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.14.0/prometheus-2.14.0.linux-amd64.tar.gz
RUN tar -xvzf prometheus-2.14.0.linux-amd64.tar.gz
RUN mv prometheus-2.14.0.linux-amd64 prometheus
RUN rm -rf prometheus-2.14.0.linux-amd64.tar.gz

WORKDIR /usr/mware/prometheus/

EXPOSE 9090

ENTRYPOINT [ "./prometheus" ]

# To build the image
# docker image build -t vimal/prometheus:1.0 .

# Create network
# docker network create --driver=bridge prom-network

# To run the prom container
# docker run --name prometheus-vimal --network prom-network -p 9090:9090 -v /Users/vimal/development/playground/prometheus-playground/prom-docker/prometheus.yml:/usr/mware/prometheus/prometheus.yml -v /Users/vimal/development/playground/prometheus-playground/prom-docker/alert.rules.yml:/usr/mware/prometheus/alert.rules.yml --rm -dt vimal/prometheus:1.0

# To run the node-exporter
# docker run --name node-exporter-vimal --network prom-network -p 9100:9100 --rm -dt vimal/node-exporter:1.0

# docker run --name alertmanager-vimal --network prom-network -p 9093:9093 --rm -dt vimal/alertmanager:1.0