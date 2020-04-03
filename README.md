# docker-jupyter-extended

**_Docker image containing JupyterLab, several extensions, and additional Python packages_**

<p align="center">
<a href="https://hub.docker.com/r/dynobo/docker-jupyter-extended/"><img alt="Docker: pulls" src="https://img.shields.io/docker/pulls/dynobo/docker-jupyter-extended.svg?maxAge=2592000?style=flat-square"></a>
<a href="https://microbadger.com/images/dynobo/docker-jupyter-extended"><img alt="Image Metadata" src="https://images.microbadger.com/badges/image/dynobo/docker-jupyter-extended.svg"></a>
<a href="https://opensource.org/licenses/mit-license.php"><img alt="License: MIT" src="https://badges.frapsoft.com/os/mit/mit.png?v=103"></a>
</p>

I use this image to jump-start data-related notebooks for experimental and educational purposes.

**Not meant for productive use! Jupyter lab runs as root inside docker!**

Built from official [`python:3.7-slim`](https://hub.docker.com/_/python/) base image, extended by the following packages:

## JupyterLab Extensions

- `@ijmbarr/jupyterlab_spellchecker` (en_US spell checker)
- `@ryantam626/jupyterlab_code_formatter` (Auto code formatting)
- `@jupyterlab/toc` (Table of contents)
- `@lckr/jupyterlab_variableinspector` (Live view of program variables)

## Python Libraries

- `black` (Formatter)

## Build and run with Docker

- `docker build -t docker-jupyter-extended:0.3 .`
- `docker run --rm -it -p 8888:8888/tcp docker-jupyter-extended:0.3`
- Open link printed in console in Browser: <http://127.0.0.1:8888/?token=8f0b0...>

## Development

**Clone and build:**

```sh
git clone https://github.com/dynobo/docker-jupyter-extended.git
cd docker-jupyter-extended
make build
make run
```

**Publish:**

```sh
git tag <VERSION>
git push --tags
```
