NAME	= appsoa/docker-alpine-angular-cli
ALIAS	= ng
VERSION	= 1.0.0

.PHONY:	all build test tag_latest release ssh

all:	clean build

build:

	@echo "Building an image with the current tag $(NAME):$(VERSION).."
	@docker build -t $(NAME):$(VERSION) --rm .

clean: docker-current-clean-images docker-current-clean-volumes docker-global-clean-images

run:

	docker run 	--rm -it 				\
				--publish 4200:4200		\
				--entrypoint="/bin/sh" 	\
				--volume $(PWD):/app 	\
				$(NAME):$(VERSION)

tag_azure:

	docker tag $(NAME):$(VERSION) streamingplatform.azurecr.io/$(NAME)

tag_latest:

	docker tag $(NAME):$(VERSION) $(NAME):latest

push_azure:

	# docker push appsoadevqa.azurecr.io/$(NAME)
	docker push streamingplatform.azurecr.io/$(NAME)

release:

	docker push $(NAME)
