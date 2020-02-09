FROM jupyter/scipy-notebook:7a0c7325e470

LABEL maintainer="dynobo@mailbox.org"

# Conda Packages
RUN conda install --yes \
    black=19.10b0 \
    jupyterlab=1.2.5 \
    jupyterlab_code_formatter=1.0.3 

# Jupyter lab extensions
RUN jupyter labextension install \
    @ijmbarr/jupyterlab_spellchecker@0.1.5 \
    @jupyterlab/toc@2.0.0-rc.0 \
    @lckr/jupyterlab_variableinspector@0.3.0 \
    @ryantam626/jupyterlab_code_formatter@1.0.3 \
    --no-build

# Autoformatter (commands need to be in correct order)
RUN jupyter serverextension enable --py jupyterlab_code_formatter

# Rebuild Jupyter lab
RUN jupyter lab build

# Config files
COPY --chown=jovyan:users home /home/jovyan/

# Cleanup 
# - /work was only needed for backward-compatibility
RUN rm -rf /home/jovyan/work && \
    conda clean --all --force-pkgs-dirs --yes && \
    npm --version \
    npm cache clean --force