FROM simbo/node:8.1.4

RUN set -ex; \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -; \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list; \
  apt-get update -qq; \
  apt-get install -qq -y --no-install-recommends google-chrome-stable; \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/*
