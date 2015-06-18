FROM node:0.10-onbuild

ADD . /

WORKDIR /

RUN npm install forever -g
RUN npm install subkit-microservice@0.2.75 -g

RUN subkit new web-service
RUN subkit install web-service dashboard

ENV SERVICE_PORT=50000
ENV SERVICE_SSL=0
ENV SERVICE_APIKEY=abcde12345

ENTRYPOINT subkit start web-service