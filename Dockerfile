FROM riptidepy/php:7.2

# Install Node 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt -y install nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install baler
RUN apt update && apt -y install git && \
    git clone https://github.com/magento/baler.git /balersrc && \
    cd /balersrc && \
    npm install && \
    npm test && \
    npm run build && \
    npm link && \
    apt -y remove git && \
    rm -rf /var/lib/apt/lists/*

CMD ["baler"]
