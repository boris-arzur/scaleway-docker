DOCKER_NAMESPACE =	armbuild/
NAME =			ocs-app-docker
VERSION =		vivid
VERSION_ALIASES =	15.04
IS_LATEST =		1
TITLE =			Docker 1.3.2
DESCRIPTION =		Docker 1.3.2 + fig + gosu + nsenter + pipework
SOURCE_URL =		https://github.com/online-labs/image-app-docker


## Image tools  (https://github.com/online-labs/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/image-tools-install | bash
-include docker-rules.mk


## Here you can add custom commands and overrides
update_fig:
       docker run --rm armbuild/docker-fig bash -c 'cat /code/dist/fig-*-py2.7.egg' > sources/fig.egg


update_nsenter:
       docker run --rm -v $(PWD)/patches/usr/bin:/target armbuild/jpetazzo-nsenter
