FROM archlinux:latest

MAINTAINER Jon Packard <jon@packard.tech>
#Credit to https://github.com/choldrim/docker-distcc for the entrypoint.sh script.

RUN pacman --noconfirm --needed -Syu distcc gcc clang \ 
    && rm -rf /var/cache/pacman/pkg/*

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3632
ENTRYPOINT ["/entrypoint.sh"]

#docker run -d -e NETWORK=10.0.0.1/16 -e JOBS=4 -p 3632:3632 --user distcc al-distcc-server
