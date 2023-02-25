const puppeteer = require('puppeteer-extra')
const {executablePath} = require('puppeteer');
const assert = require('assert')

const StealthPlugin = require('puppeteer-extra-plugin-stealth')
puppeteer.use(StealthPlugin())

 async function main(){

    const browserOptions = {
        args: [
        '--remote-debugging-port=9222',
        '--no-sandbox',
        '--remote-debugging-address=0.0.0.0',
        '--disable-dev-shm-usage',
        '--disable-gpu'
        ],
        defaultViewport: null,
        executablePath: executablePath()
    }
    console.log("launching browser")

    const browser = await puppeteer.launch(browserOptions)
    const page = await browser.newPage()
    await page.setViewport({ width: 1920, height: 1080 })
    const response = await page.goto('https://google.com')
    assert(response.ok())
    await page.close()
    await browser.disconnect()
    console.log("browser launched")
}

main()