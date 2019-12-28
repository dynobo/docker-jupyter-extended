FROM jupyter/scipy-notebook:7a0c7325e470

LABEL maintainer="dynobo@mailbox.org"

RUN conda install --yes black flake8 

# Jupyter lab extensions
RUN jupyter labextension install \
    @ijmbarr/jupyterlab_spellchecker@0.1.5 \
    @jupyterlab/toc@2.0.0-rc.0 \
    @krassowski/jupyterlab_go_to_definition@0.7.1 \
    jupyterlab-flake8@0.4.1 \
    @lckr/jupyterlab_variableinspector@0.3.0 

# Autoformatter (commands need to be in correct order)
RUN jupyter labextension install @ryantam626/jupyterlab_code_formatter@0.7.0 && \
    conda install --yes jupyterlab_code_formatter=0.7.0 && \
    jupyter serverextension enable --py jupyterlab_code_formatter

# Will replace "jupyterlab_go_to_definition" and "jupyterlab-flake8",
# but not yet stable enough
# RUN conda install --yes python-language-server && \
#     pip install --pre jupyter-lsp && \
#     jupyter labextension install @krassowski/jupyterlab-lsp@0.6.1

# Config files
COPY --chown=jovyan:users home /home/jovyan/

# Cleanup 
# - /work was only needed for backward-compatibility
RUN rm -rf /home/jovyan/work && \
    conda clean --all --force-pkgs-dirs --yes && \
    npm cache clean --force