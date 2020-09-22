FROM golang:1.12-alpine as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
        && apk upgrade \
        && apk add --no-cache \
        ca-certificates \
        && update-ca-certificates 2>/dev/null
RUN apk add google-authenticator git gcc libc-dev linux-pam-dev ;\
    wget https://github.com/tg123/sshpiper/archive/master.zip -O /tmp/master.zip ;\
    cd /tmp/ ;\
    unzip master.zip ; \
    mkdir -p /go/src/github.com/tg123/ /root/.glide/ ; \
    mv /tmp/sshpiper-master /go/src/github.com/tg123/sshpiper

#ADD . /go/src/github.com/tg123/sshpiper/
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn
#ENV http_proxy=10.8.104.73:1081
#ENV https_proxy=10.8.104.73:1081
WORKDIR /go/src/github.com/tg123/sshpiper/sshpiperd

RUN go build -ldflags "$(/go/src/github.com/tg123/sshpiper/sshpiperd/ldflags.sh)" -tags pam -o /go/bin/sshpiperd


FROM alpine:latest 

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
        && apk upgrade \
        && apk add --no-cache \
        ca-certificates \
        && update-ca-certificates 2>/dev/null
        
RUN apk add google-authenticator

RUN mkdir /etc/ssh/

COPY --from=builder /go/src/github.com/tg123/sshpiper/entrypoint.sh /
COPY --from=builder /go/bin/sshpiperd /
EXPOSE 2222

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/sshpiperd", "daemon"]