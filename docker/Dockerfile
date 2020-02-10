ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter finely <chengyitang@gmail.com>"

USER root

# Install nbextensions
RUN pip install jupyter_contrib_nbextensions && \
    pip install jupyter_nbextensions_configurator  && \
    jupyter contrib nbextension install && \
    jupyter nbextensions_configurator enable && \
    pip install jupyterthemes && \
    pip install yapf && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

