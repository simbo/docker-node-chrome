#===============================================================================
# [!] Recommended params for running this image
#===============================================================================
#
# --cap-add=SYS_ADMIN
# This fixes a user namespace issue with OSX.
# An alternative mitigation would be to a special seccomp profile:
# https://twitter.com/jessfraz/status/681934414687801345
#
# --shm-size=1024M
# Chrome needs some more shared memory than docker's default of 64 MB.
# Alternatively you can mount `/dev/shm` from your host machine.
#
#===============================================================================

FROM simbo/node:8-slim

RUN set -ex; \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -; \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list; \
  apt-get update -qq; \
  apt-get install -qq -y --no-install-recommends google-chrome-stable; \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/*

CMD google-chrome \
  --headless \
  --disable-gpu \
  --remote-debugging-port=9222 \
  --window-size=1280x1024 \
  --no-default-browser-check \
  --no-first-run \
  --disable-default-apps \
  --disable-popup-blocking \
  --disable-translate \
  --disable-background-timer-throttling \
  --disable-renderer-backgrounding \
  --disable-device-discovery-notifications
