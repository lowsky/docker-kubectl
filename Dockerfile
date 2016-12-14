FROM wernight/kubectl

# add gettext for running envsubst
USER root
RUN set -x && \
    apk add --update --no-cache gettext

USER kubectl
