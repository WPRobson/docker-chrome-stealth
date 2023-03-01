# docker-chrome-stealth

A Puppeteer docker image that will launch a chrome browser using [puppeteer-extra-plugin-stealth](https://github.com/berstend/puppeteer-extra/tree/master/packages/puppeteer-extra-plugin-stealth).
 
Browser is also launched exposing remote debugging on port 9222

## Usage

index.js is executed by default and is responsible for launching a chrome browser with the relevant launch options

Build image
    ```$ docker build -t docker-chrome-stealth . ```

image is also available from ghcr
   ``` $ docker pull ghcr.io/wprobson/docker-chrome-stealth:latest ```