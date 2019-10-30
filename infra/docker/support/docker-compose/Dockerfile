FROM docker:19.03

RUN apk add --no-cache \
	--virtual build-dependencies \
	py-pip \
	python-dev \
	build-base \
	libffi-dev \
	openssl-dev \
	&& pip install docker-compose \
	&& apk del build-dependencies
