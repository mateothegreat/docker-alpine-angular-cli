#
# Starts ng serve by detault.
# To override pass the --entrypoint="some command" to the docker command.
#
FROM node:9.2-alpine

WORKDIR     /app
VOLUME      [ "/app" ]
RUN         yarn global add @angular/cli
EXPOSE      4200

ENTRYPOINT  [ "ng", "serve", "--host 0.0.0.0" ]