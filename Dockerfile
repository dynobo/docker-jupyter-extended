FROM jupyter/scipy-notebook:7a0c7325e470

LABEL maintainer="dynobo@mailbox.org"

RUN conda install --yes black flake8 jupyterlab=1.2.5

# Jupyter lab extensions
RUN jupyter labextension install \
    @ijmbarr/jupyterlab_spellchecker@0.1.5 \
    @jupyterlab/toc@2.0.0-rc.0 \
    @lckr/jupyterlab_variableinspector@0.3.0 --no-build
#    @krassowski/jupyterlab_go_to_definition@0.7.1 \
#    jupyterlab-flake8@0.4.0 \

# Autoformatter (commands need to be in correct order)
RUN jupyter labextension install @ryantam626/jupyterlab_code_formatter@1.0.3 --no-build && \
    conda install --yes jupyterlab_code_formatter=1.0.3 && \
    jupyter serverextension enable --py jupyterlab_code_formatter

# Will replace "jupyterlab_go_to_definition" and "jupyterlab-flake8",
# but not yet stable enough. Needs Jupyterlab >=1.2.4 !
RUN conda install --yes python-language-server && \
    pip install --pre jupyter-lsp && \
    jupyter labextension install @krassowski/jupyterlab-lsp@0.7.1 --no-build

# Rebuild Jupyter lab
RUN jupyter lab build

# Config files
COPY --chown=jovyan:users home /home/jovyan/

# Cleanup 
# - /work was only needed for backward-compatibility
RUN rm -rf /home/jovyan/work && \
    conda clean --all --force-pkgs-dirs --yes && \
    npm cache clean --force