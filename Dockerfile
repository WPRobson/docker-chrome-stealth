FROM node:latest
WORKDIR /puppeteer

EXPOSE 9222

RUN apt-get update -qqy \
  && DEBIAN_FRONTEND="noninteractive" apt-get -qqy install apt-transport-https inotify-tools gnupg \
    libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libcairo2 libcups2 \
    libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
    libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 \
    libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxss1 libxtst6 \
    libappindicator1 libnss3 libnss3-tools libasound2 libatk1.0-0 libc6 ca-certificates fonts-liberation \
    libatk-bridge2.0-0 libgbm1 lsb-release xdg-utils wget unzip curl \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

COPY package.json .
COPY package-lock.json .
RUN npm ci
RUN npm install puppeteer --unsafe-perm=true --allow-root

COPY index.js .
COPY entrypoint.sh .

ENTRYPOINT ["/entrypoint.sh"]