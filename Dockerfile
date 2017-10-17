FROM fedora:26

RUN dnf makecache

RUN dnf install -y icedtea-web java-1.8.0-openjdk pangox-compat.i686 libXmu.i686 mesa-libEGL.i686 gtk2.i686 libpng.i686 alsa-lib.i686 libXtst.i686 libart_lgpl.i686 wget dbus-glib.i686 gtk3.i686 bzip2

RUN useradd -m webex -d /opt/webex

RUN sh -c "wget -q 'https://download.mozilla.org/?product=firefox-56.0.1-SSL&os=linux&lang=en-US' -O - | tar jxvf - -C /opt/webex"

RUN chown -R webex: /opt/webex/firefox

ENV DISPLAY :0

USER webex

WORKDIR /opt/webex/firefox

ENTRYPOINT /opt/webex/firefox/firefox-bin
