# Prometheus in Docker

This effort is to help me understand on how to setup prometheus server, push gateway and its alert manager from start to end without any tools from the market.

I would've simply used the docker images which prometheus gives, however this excercise is purely for my own learning purpose on how things work.

## Setup

- Create a docker network for this entire setup first: `docker network create --driver=bridge prom-network`
- Clone this repo
- From the parent directory, run:

```bash
docker image build -t vimal/prometheus:1.0 .
cd node-exporter-docker
docker image build -t vimal/node-exporter:1.0 .
cd ../alert-manager-docker
docker image build -t vimal/alertmanager:1.0 .
cd ..
```

- Create the prometheus container:

```bash
docker run --name prometheus-vimal --network prom-network -p 9090:9090 -v /Users/vimal/development/playground/prometheus-playground/prom-docker/prometheus.yml:/usr/mware/prometheus/prometheus.yml -v /Users/vimal/development/playground/prometheus-playground/prom-docker/alert.rules.yml:/usr/mware/prometheus/alert.rules.yml --rm -dt vimal/prometheus:1.0
```

I've created two volume points here, one for `prometheus` configuration and another for `alert rules`. Please refer those files

- Create the node exporter container:

```bash
docker run --name node-exporter-vimal --network prom-network -p 9100:9100 --rm -dt vimal/node-exporter:1.0
```

- Create the alert manager container:

```bash
docker run --name alertmanager-vimal --network prom-network -p 9093:9093 --rm -dt vimal/alertmanager:1.0
```

- Prometheus: http://localhost:9090/
- Node Exporter: http://localhost:9100/metrics
- Alert Manager: http://localhost:9093/
