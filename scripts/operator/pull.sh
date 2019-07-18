docker pull quay.io/prometheus/alertmanager:v0.17.0
docker pull quay.io/coreos/prometheus-operator:v0.31.1
docker pull quay.io/coreos/configmap-reload:v0.0.1
docker pull quay.io/coreos/prometheus-config-reloader:v0.31.1
docker pull k8s.gcr.io/hyperkube:v1.12.1
docker pull quay.io/prometheus/prometheus:v2.10.0
docker pull grafana/grafana:6.2.5

docker tag quay.io/prometheus/alertmanager:v0.17.0 chadmoon/alertmanager:v0.17.0
docker tag quay.io/coreos/prometheus-operator:v0.31.1 chadmoon/prometheus-operator:v0.31.1
docker tag quay.io/coreos/configmap-reload:v0.0.1 chadmoon/configmap-reload:v0.0.1
docker tag quay.io/coreos/prometheus-config-reloader:v0.31.1 chadmoon/prometheus-config-reloader:v0.31.1
docker tag k8s.gcr.io/hyperkube:v1.12.1 chadmoon/hyperkube:v1.12.1
docker tag quay.io/prometheus/prometheus:v2.10.0 chadmoon/prometheus:v2.10.0
docker tag grafana/grafana:6.2.5 chadmoon/grafana:6.2.5

docker push chadmoon/alertmanager:v0.17.0
docker push chadmoon/prometheus-operator:v0.31.1
docker push chadmoon/configmap-reload:v0.0.1
docker push chadmoon/prometheus-config-reloader:v0.31.1
docker push chadmoon/hyperkube:v1.12.1
docker push chadmoon/prometheus:v2.10.0
docker push chadmoon/grafana:6.2.5