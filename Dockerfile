FROM steamcmd/steamcmd:ubuntu-20

ENV SERVER_PORT=2001/udp
ENV STEAM_QUERY_PORT=17777/udp
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y libcurl4 libssl1.1

RUN addgroup --system container
RUN adduser --system --home /home/container --disabled-password --shell /bin/bash container

RUN mkdir /home/container/profile

COPY --chown=container:container "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x "/entrypoint.sh"

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

EXPOSE ${SERVER_PORT}
EXPOSE ${STEAM_QUERY_PORT}

ENTRYPOINT [ "/entrypoint.sh" ]

# Metadata
LABEL org.opencontainers.image.title="Arma Reforger Server"
LABEL org.opencontainers.image.authors="Jakob Klemm <github@jeykey.net>, Lukas Huber <lukas.lh@gmx.ch>"