# The binary to build (just the basename).
MODULE := docker-jupyter-extended

# Where to push the docker image.
REGISTRY ?= dynobo

IMAGE := $(REGISTRY)/$(MODULE)

# This version-strategy uses git tags to set the version string
TAG := $(shell git describe --tags --always --dirty)

BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Example: make build-dev TAG=0.1
build:
	@echo "\n${BLUE}Building Development image with labels:\n"
	@echo "name: $(MODULE)"
	@echo "version: $(TAG)${NC}\n"
	@sed                                 \
	    -e 's|{NAME}|$(MODULE)|g'        \
	    -e 's|{VERSION}|$(TAG)|g'        \
	    Dockerfile | docker build -t $(IMAGE):$(TAG) -f- .

run:
	@echo "Starting $(IMAGE):$(TAG):\n"
	@docker run $(IMAGE):$(TAG)

push: build
	@echo "\n${BLUE}Pushing image to GitHub Docker Registry...${NC}\n"
	@docker push $(IMAGE):$(TAG)

version:
	@echo $(TAG)

clean:
	@docker system prune -f --filter "label=name=$(MODULE)"
