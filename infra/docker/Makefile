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

all: grafana trickster

# MONITORING
grafana:
	cd monitoring/grafana && docker build -t $(DOCKER_REGISTRY)/grafana:$(IMAGE_TAG) .

trickster:
	cd monitoring/trickster && docker build -t $(DOCKER_REGISTRY)/trickster:$(IMAGE_TAG) .

push: grafana-push trickster-push

grafana-push:
	docker push $(DOCKER_REGISTRY)/grafana:$(IMAGE_TAG)
trickster-push:
	docker push $(DOCKER_REGISTRY)/trickster:$(IMAGE_TAG)
