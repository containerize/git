FROM alpine:3.6

RUN apk add --no-cache git

ENV REPO_NAME hello
ENV REPO_LOCAL /data/git/repos/$REPO_NAME
ENV REPO_REMOTE https://github.com/containerize/git

COPY git-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "git-entrypoint.sh"]
