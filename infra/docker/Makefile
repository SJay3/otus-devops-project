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

all: monitoring
.PHONY: all
	
# MONITORING
monitoring: grafana trickster alertmanager
grafana:
	cd monitoring/grafana && docker build -t $(DOCKER_REGISTRY)/grafana:$(IMAGE_TAG) .

trickster:
	cd monitoring/trickster && docker build -t $(DOCKER_REGISTRY)/trickster:$(IMAGE_TAG) .

alertmanager:
	cd monitoring/alertmanager && docker build -t $(DOCKER_REGISTRY)/alertmanager:$(IMAGE_TAG) .

push: monitoring-push
monitoring-push: grafana-push trickster-push alertmanager-push

grafana-push:
	docker push $(DOCKER_REGISTRY)/grafana:$(IMAGE_TAG)
trickster-push:
	docker push $(DOCKER_REGISTRY)/trickster:$(IMAGE_TAG)
alertmanager-push:
	docker push $(DOCKER_REGISTRY)/alertmanager:$(IMAGE_TAG)
