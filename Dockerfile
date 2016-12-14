FROM wernight/kubectl

# add gettext for running envsubst
RUN set -x && \
    apk add --update --no-cache gettext 
