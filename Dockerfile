FROM postgres:9.4

MAINTAINER Crobays <crobays@userex.nl>

LABEL DOCKER_NAME postgres

ENV TIMEZONE UTC
ENV ENVIRONMENT production

RUN sed -i 's/#\!\/bin\/bash/#\!\/bin\/bash\necho "\$TIMEZONE" > \/etc\/timezone \&\& dpkg-reconfigure -f noninteractive tzdata/' "/docker-entrypoint.sh"
RUN sed -i 's/set_listen_addresses() {/set_listen_addresses(){\n\tsource \/config.sh/' "/docker-entrypoint.sh"

ADD /config.sh /config.sh
