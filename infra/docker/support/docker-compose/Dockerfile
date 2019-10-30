FROM docker:19.03

RUN apk add --no-cache py-pip
RUN apk add --no-cache \
	--virtual build-dependencies \
	python-dev \
	build-base \
	libffi-dev \
	openssl-dev \
	&& pip install docker-compose \
	&& apk del build-dependencies
