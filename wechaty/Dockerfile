FROM node:12.18.2-stretch as builder

ADD package.json /bot/package.json
RUN set -eux ; \
    cd /bot/; \
    npm i --prod --unsafe-perm

FROM node:12.18.2-stretch-slim
ADD package.json /bot/package.json
COPY --from=builder /bot/node_modules /bot/node_modules


WORKDIR /bot/
RUN set -eux;\
    apt update ;\
    apt install\
      tzdata \
      libglib2.0-0 \ 
      libnss3 \
      libatk1.0-0 \
      libatk-bridge2.0-0 \
      libcups2 \
      libdrm2 \
      libxkbcommon0 \
      libxcomposite1 \
      libxdamage1 \
      libxrandr2 \
      libgbm1 \
      libgtk-3.0 \
      libasound2 \
      ;\ 
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone;\
    echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list ; \
    echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list ;\
    apt autoremove; \
    apt clean 
