UBUNTU=18.04

usage:
	@echo "Run make update, make build, and make push"

update:
	docker pull ubuntu:${UBUNTU}

build:
	cd lib7842-image && docker build -t theol0403/lib7842-image:${UBUNTU} .

push:
	docker push theol0403/lib7842-image:${UBUNTU}
