# docker-jupyter-extended

***Docker image containing JupyterLab, several extensions, and additional Python packages***

<p align="center">
<a href="https://hub.docker.com/r/dynobo/docker-jupyter-extended/"><img alt="Docker: pulls" src="https://img.shields.io/docker/pulls/dynobo/docker-jupyter-extended.svg?maxAge=2592000?style=flat-square"></a>
<a href="https://microbadger.com/images/dynobo/docker-jupyter-extended"><img alt="Image Metadata" src="https://images.microbadger.com/badges/image/dynobo/docker-jupyter-extended.svg"></a>
<a href="https://opensource.org/licenses/mit-license.php"><img alt="License: MIT" src="https://badges.frapsoft.com/os/mit/mit.png?v=103"></a>
</p>

I use this image to jump-start data-related notebooks for experimental and educational purposes.

Built from [`jupyter/scipy-notebook`](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) base image, extended by the following packages:

## JupyterLab Extensions

- `@ijmbarr/jupyterlab_spellchecker` (en_US spell checker)
- `@ryantam626/jupyterlab_code_formatter` (Auto code formatting)
- `@jupyterlab/toc` (Table of contents)
- `@lckr/jupyterlab_variableinspector` (Live view of program variables)

## Python Libraries

- `black` (Formatter)