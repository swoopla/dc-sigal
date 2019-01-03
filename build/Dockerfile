FROM python:alpine as BUILDER

ENV LIBRARY_PATH=/lib:/usr/lib

RUN apk add --update build-base python-dev jpeg-dev zlib-dev && pip install sigal




FROM python:alpine

LABEL MAINTAINER "Swoopla <p.vibet@gmail.com>"

ENV LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

COPY --from=BUILDER /usr/local /usr/local

RUN apk add zlib jpeg

EXPOSE 8000

WORKDIR /srv

VOLUME /srv/pictures /srv/_build

COPY entrypoint.sh .

ENTRYPOINT ["/srv/entrypoint.sh"]

CMD ["sigal --debug --force serve"] 
