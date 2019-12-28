
FROM jupyter/scipy-notebook:7a0c7325e470

LABEL maintainer="dynobo@mailbox.org"

# Remove work dir (was only needed for backward-compatibility)
RUN rm -rf /home/$NB_USER/work

# Additional conda packages
RUN conda update -n base conda && \
    conda install --yes black jupyterlab_code_formatter flake8

# Jupyter lab extensions
RUN jupyter labextension install \
    @ijmbarr/jupyterlab_spellchecker@0.1.5 \
    jupyterlab-flake8@0.4.1 \
    @jupyterlab/toc@2.0.0-rc.0 \
    @krassowski/jupyterlab_go_to_definition@0.7.1 \
    @lckr/jupyterlab_variableinspector@0.3.0 \
    @ryantam626/jupyterlab_code_formatter@1.0.3 \
    && \
    jupyter serverextension enable --py jupyterlab_code_formatter