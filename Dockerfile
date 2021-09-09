FROM ubuntu

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Europe/Berlin"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -y pandoc python3-dev curl make zip git ffmpeg
RUN apt-get install -y python3-pip build-essential
RUN pip install pycryptodomex

WORKDIR /project

COPY ./init.sh .
RUN ./init.sh

COPY ./config.sh .
COPY ./southpark-downloader.sh .

VOLUME ["/downloads"] 

ENTRYPOINT ["./southpark-downloader.sh"]
