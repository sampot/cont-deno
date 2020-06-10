GROUP=sampot
NAME=deno
VERSION=1.0.5-spk1

all: build

build: Dockerfile
	docker build  -t $(GROUP)/$(NAME):$(VERSION) .
	docker tag $(GROUP)/$(NAME):$(VERSION) $(GROUP)/$(NAME):latest

publish:
	docker push $(GROUP)/$(NAME):$(VERSION)
	docker push $(GROUP)/$(NAME):latest
