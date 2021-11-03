FROM elixir:alpine
#Update and install bash
RUN apk --update --upgrade add inotify-tools bash alpine-sdk \
    && update-ca-certificates --fresh \
    && rm -rf /var/cache/apk/*
# Workdir
ADD . /api
WORKDIR /api
# Elixir run
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
COPY ./entrypoint.sh /
RUN chmod 777 /entrypoint.sh
#RUNTIME Commands
CMD [ "./entrypoint.sh" ]