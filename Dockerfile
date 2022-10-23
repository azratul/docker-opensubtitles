
FROM alpine:3.13

RUN apk --update add \
    nodejs \ 
    npm \ 
    ffmpeg \ 
    bash

RUN adduser -D opensubs

USER opensubs

COPY --chown=opensubs:opensubs . /app

WORKDIR /app

ENV NODE_ENV=production

# where to check
VOLUME [ "/movies", "/series", "/tmp", "/config" ]

RUN npm install --only=production

ENTRYPOINT [ "node", "index.js" ]
