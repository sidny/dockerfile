FROM node:12.18.2-stretch as builder

ADD wechaty/package.json /bot/package.json
RUN set -eux ; \
    cd /bot/; \
    npm i --prod --unsafe-perm

FROM node:12.18.2-stretch-slim
ADD wechaty/package.json /bot/package.json
COPY --from=builder /bot/node_modules /bot/node_modules


WORKDIR /bot/
RUN set -eux;\
    echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list ; \
    echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list ;\
    apt install tzdata ; \ 
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone;\
    apt clean 
