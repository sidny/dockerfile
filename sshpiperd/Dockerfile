FROM golang:1.12-alpine as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
        && apk upgrade \
        && apk add --no-cache \
        ca-certificates \
        && update-ca-certificates 2>/dev/null
RUN apk add google-authenticator glide git gcc libc-dev linux-pam-dev ;\
    wget https://github.com/tg123/sshpiper/archive/master.zip -O /tmp/master.zip ;\
    cd /tmp/ ;\
    unzip master.zip ; \
    mkdir -p /go/src/github.com/tg123/ /root/.glide/ ; \
    mv /tmp/sshpiper-master /go/src/github.com/tg123/sshpiper

#ADD . /go/src/github.com/tg123/sshpiper/
ENV GO111MODULE=on
WORKDIR /go/src/github.com/tg123/sshpiper/sshpiperd
#RUN glide mirror set https://golang.org/x/mobile https://github.com/golang/mobile.git ;\
#     glide mirror set https://golang.org/x/crypto https://github.com/golang/crypto.git ;\
#     glide mirror set https://golang.org/x/net https://github.com/golang/net.git ;\
#     glide mirror set https://golang.org/x/tools https://github.com/golang/tools.git ;\
#     glide mirror set https://golang.org/x/text https://github.com/golang/text.git ;\
#     glide mirror set https://golang.org/x/image https://github.com/golang/image.git ;\
#     glide mirror set https://golang.org/x/sys https://github.com/golang/sys.git ;\
#     glide mirror set https://golang.org/x/net https://github.com/golang/net.git ;

RUN go build -ldflags "$(/go/src/github.com/tg123/sshpiper/sshpiperd/ldflags.sh)" -tags pam -o /go/bin/sshpiperd


FROM alpine:latest 

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