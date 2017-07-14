docker-node-chrome
==================

> Docker image with node and headless chrome (i.e. for testing with karma or protractor).

[![docker:simbo/node-chrome](https://img.shields.io/docker/build/simbo/node-chrome.svg)](https://hub.docker.com/r/simbo/node-chrome/)

Derivate of [simbo/node](https://hub.docker.com/r/simbo/node/).

``` sh
docker pull simbo/node-chrome:latest
```


## Version tags

  - `latest` / `0.1.0`
    Node 8.1.4  
    Google Chrome 59.0.3071.115


## Usage


### Docker

Use these flags with `docker run …` or add them to your service in `docker-compose.yml`:

  - `--add-cap=SYS_ADMIN`  
    This fixes a user namespace issue with OSX.  
    An alternative mitigation would be to a [special seccomp profile](https://twitter.com/jessfraz/status/681934414687801345).

  - `--shm-size=1024M`  
    Chrome needs some more shared memory than docker's default of 64 MB.  
    Alternatively you can mount `/dev/shm` from your host machine into the container.


### Karma

`karma.conf.js`:

``` js
module.exprots = (config) => {
  config.set({
    mime: {
      'text/x-typescript': ['ts','tsx']
    },
    browsers: [
      'Chrome_launcher'
    ],
    customLaunchers: {
      Chrome_launcher: {
        base: 'ChromeHeadless',
        flags: [
          '--window-size=1280x1024'
        ],
      }
    }
  });
};
```


### Protractor

Run `webdriver-manager update` to install chromedriver.

`protractor.conf.js`:

``` js
module.exports.config = {
  directConnect: true,
  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: [
        '--headless',
        '--disable-gpu',
        '--window-size=1280x1024'
      ]
    }
  }
};
```
