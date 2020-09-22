FROM nginx:alpine

RUN wget https://github.com/zerofo/ps4jb/archive/master.zip -O /tmp/ps4jb.zip ; \
    cd /tmp/; \
    unzip ps4jb.zip ; \
    mv ps4jb-master/*  /usr/share/nginx/html/ ; \
    rm -rf /tmp/*
    