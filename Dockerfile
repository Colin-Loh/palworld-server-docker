FROM ubuntu:25.04
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install wget lib32gcc-s1 ca-certificates unzip curl -y

RUN useradd -m -s /bin/bash paladmin

RUN mkdir -p /home/paladmin/steamcmd && \
    chown -R paladmin:paladmin /home/paladmin/steamcmd

USER paladmin
WORKDIR /home/paladmin/steamcmd

RUN curl -o steamcmd_linux.tar.gz "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
    tar -xzf steamcmd_linux.tar.gz

RUN ./steamcmd.sh +force_install_dir /home/paladmin/steamcmd/palworld/ +login anonymous +app_update 2394010 validate +quit

WORKDIR /home/paladmin/steamcmd/palworld/
ENTRYPOINT ["./PalServer.sh"]