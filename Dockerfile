FROM node:12-alpine
RUN apk add --no-cache git && \
    git clone https://github.com/magento/baler.git /balersrc && \
    cd /balersrc && \
    npm install && \
    npm test && \
    npm run build && \
    npm link && \
    apk del git

CMD ["baler"]
