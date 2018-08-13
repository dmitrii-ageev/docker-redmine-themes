FROM busybox
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Declare the enviroment variable
ENV REDMINE_THEMES /usr/src/redmine/public/themes

# Install themes
COPY themes/* ${REDMINE_THEMES}/
RUN \
    mkdir -p ${REDMINE_THEMES} \
    && cd ${REDMINE_THEMES} \
    && ls *.zip | xargs -n1 unzip -q \
    && mv Redmine\ 3.4\ and\ higher/* . \
    && rm -fr Redmine\ 3.* \
    && rm -f *.zip

# Change owner to redmine:redmine
RUN chown -R 999:999 ${REDMINE_THEMES}
RUN chmod 775 ${REDMINE_THEMES}

# Declare the volume
VOLUME ${REDMINE_THEMES}
