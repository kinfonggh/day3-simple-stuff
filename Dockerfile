FROM docker.io/websphere-liberty:javaee8
COPY target/simple-stuff.war /config/dropins/
COPY config/server.xml /config/
COPY config/server.env /config/
# Run as the root user
USER root

# Create the new special folder
RUN mkdir /my-special-folder

COPY Dockerfile  /my-special-folder/Dockerfile

RUN chgrp -R 0 /my-special-folder && \
    chmod -R g=u /my-special-folder

USER 1001
