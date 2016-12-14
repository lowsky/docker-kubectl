FROM wernight/docker-kubectl

# add gettext for running envsubst
RUN set -x && \
    apk add --no-cache gettext 
