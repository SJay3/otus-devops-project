# сборка и пушинг докер образов
# Имя пользователя на докер-хабе
DOCKER_REGISTRY = $(USER_NAME)
#VERSION = $(VER)
TAG = crawler

ifdef VER
  IMAGE_TAG = $(TAG)-$(VER)
else
  IMAGE_TAG = $(TAG)
endif

MONGO_EXPORTER_LINK = https://github.com/percona/mongodb_exporter.git
MONGO_EXPORTER_VERSION = 0.10.0

all: monitoring support
.PHONY: all

# SUPPORT IMAGES
support: docker-compose

docker-compose:
	cd support/docker-compose && docker build -t $(DOCKER_REGISTRY)/docker-compose:$(IMAGE_TAG) .

# MONITORING
monitoring: grafana trickster alertmanager mongodb-exporter
grafana:
	cd monitoring/grafana && docker build -t $(DOCKER_REGISTRY)/grafana:$(IMAGE_TAG) .

trickster:
	cd monitoring/trickster && docker build -t $(DOCKER_REGISTRY)/trickster:$(IMAGE_TAG) .

alertmanager:
	cd monitoring/alertmanager && docker build -t $(DOCKER_REGISTRY)/alertmanager:$(IMAGE_TAG) .

mongodb-exporter:
	cd monitoring && \
	if [ -d mongodb-exporter ]; then \
		cd mongodb-exporter && git pull && git checkout $(MONGO_EXPORTER_VERSION); \
	else git clone $(MONGO_EXPORTER_LINK) --branch $(MONGO_EXPORTER_VERSION) mongodb-exporter && \
		cd mongodb-exporter; fi; \
	docker build -t $(DOCKER_REGISTRY)/mongodb-exporter:$(IMAGE_TAG) .


push: monitoring-push support-push
monitoring-push: grafana-push trickster-push alertmanager-push mongodb-exporter-push

grafana-push:
	docker push $(DOCKER_REGISTRY)/grafana:$(IMAGE_TAG)
trickster-push:
	docker push $(DOCKER_REGISTRY)/trickster:$(IMAGE_TAG)
alertmanager-push:
	docker push $(DOCKER_REGISTRY)/alertmanager:$(IMAGE_TAG)
mongodb-exporter-push:
	docker push $(DOCKER_REGISTRY)/mongodb-exporter:$(IMAGE_TAG)

support-push: docker-compose-push

docker-compose-push:
	docker push $(DOCKER_REGISTRY)/docker-compose:$(IMAGE_TAG)
