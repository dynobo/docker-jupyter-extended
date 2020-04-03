# The binary to build (just the basename).
MODULE := notebooks

# Where to push the docker image.
REGISTRY ?= docker.pkg.github.com/dynobo/docker-jupyter-extended

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

# Example: make push VERSION=0.0.2
push: build-prod
	@echo "\n${BLUE}Pushing image to GitHub Docker Registry...${NC}\n"
	@docker push $(IMAGE):$(VERSION)

version:
	@echo $(TAG)

clean:
	@docker system prune -f --filter "label=name=$(MODULE)"
