FROM python:3.7-slim AS builder
RUN apt-get update && \
    apt-get install -y --no-install-recommends --yes \
    python3-venv \ 
    libpython3-dev \
    gcc \ 
    apt-utils dialog \
    curl vim
RUN python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip

FROM builder AS jupyter-extender
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get -y -q install nodejs
RUN /venv/bin/pip install --pre \
    jupyterlab==2.0.1 \
    ipywidgets==7.5.1 \
    jupyterlab_code_formatter==1.2.2 \
    black==19.10.b0
RUN /venv/bin/jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager@2.0 \
    @jupyterlab/toc@3.0.0 \
    @ijmbarr/jupyterlab_spellchecker@0.1.6 \
    @ryantam626/jupyterlab_code_formatter@1.2.2 \
    @lckr/jupyterlab_variableinspector@0.3 \
    --no-build
RUN /venv/bin/jupyter serverextension enable --py jupyterlab_code_formatter
RUN /venv/bin/jupyter lab build
COPY ./overrides.json /venv/share/jupyter/lab/settings/
COPY ./jupyter_notebook_config.json /root/.jupyter/

FROM jupyter-extender
ADD ./home /home
EXPOSE 8888
ENTRYPOINT ["/venv/bin/jupyter", "lab", "--ip=0.0.0.0", "--notebook-dir=/home", "--port=8888", "--allow-root"]
LABEL name={NAME}
LABEL version={VERSION}
