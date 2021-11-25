FROM node:16-stretch as builder

RUN set -eux ; \
    mkdir /bot ; cd /bot/; \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs \
    sass_binary_site=http://npm.taobao.org/mirrors/node-sass \
    disturl=http://npm.taobao.org/mirrors/node \
    chromedriver_cdnurl=http://npm.taobao.org/mirrors/chromedriver \
    SQLITE3_BINARY_SITE=http://npm.taobao.org/mirrors/sqlite3 \
    profiler_binary_host_mirror=http://npm.taobao.org/mirrors/node-inspector \
    PUPPETEER_DOWNLOAD_HOST=https://storage.googleapis.com.cnpmjs.org \
    ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/ \
    grpc_node_binary_host_mirror=https://npm.taobao.org/mirrors/ \
    registry=https://r.npm.taobao.org/ ;\
    yarn add wechaty-puppet-wechat qrcode-terminal wechaty

FROM node:16-stretch-slim
COPY --from=builder /bot /bot


WORKDIR /bot/
RUN set -eux;\
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone;\
    echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list ; \
    echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list ;\
    echo 'deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list ;\
    apt update ;\
    apt install -y \
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
    apt autoremove; \
    apt clean 
