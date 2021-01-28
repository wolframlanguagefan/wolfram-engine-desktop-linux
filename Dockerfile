FROM ubuntu

LABEL version = "1.0"
LABEL description = "Docker image for the Wolfram Engine"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt update -yq \
    && apt-get install -yq curl gcc tzdata musl-dev python3-dev python3-pip clang \
    && dpkg-reconfigure tzdata \
    && apt-get install -y avahi-daemon wget sshpass sudo locales \
    locales-all ssh nano expect libfontconfig1 libgl1-mesa-glx libasound2 \
    build-essential mosquitto mosquitto-clients libnss-mdns mdns-scan nodejs \
    && apt-get clean \
    && apt-get autoremove -y

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

RUN wget https://account.wolfram.com/download/public/wolfram-engine/desktop/LINUX \
    && sudo bash LINUX -- -auto -verbose && rm LINUX

CMD ["/usr/bin/wolframscript"]