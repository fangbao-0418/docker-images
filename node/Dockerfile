FROM  node:17-alpine

WORKDIR /app

RUN npm config set registry https://registry.npmmirror.com

COPY . .

ARG A
ARG B
ARG C
ARG D
ARG env

ENV A=${A}
ENV B=${B}
ENV C=${C}
ENV D=${D}
ENV RUN_ENV=${env}

# 如果端口更换，这边可以更新一下
EXPOSE 3000

# 启动命令默认yarn start
CMD yarn start-${RUN_ENV}