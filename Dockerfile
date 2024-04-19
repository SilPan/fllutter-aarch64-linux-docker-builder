FROM ubuntu:jammy

RUN apt update
RUN apt install pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev cmake \
                curl git unzip xz-utils zip libglu1-mesa \
                ninja-build clang \
                mpv libmpv-dev libappindicator3-1 gir1.2-appindicator3-0.1 libappindicator3-dev libsecret-1-0 libjsoncpp25 libsecret-1-dev libjsoncpp-dev libnotify-bin libnotify-dev avahi-daemon avahi-discover avahi-utils libnss-mdns mdns-scan

RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.6-stable.tar.xz
RUN tar -xJvf flutter_linux_3.19.6-stable.tar.xz
RUN rm flutter_linux_3.19.6-stable.tar.xz
RUN echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bash_profile
RUN export PATH="$HOME/development/flutter/bin:$PATH"

# try out flutter
RUN rm -Rf flutter/bin/cache  # delete x64 binaries that come pre-cached...
RUN flutter doctor

RUN apt-get clean  # delete apt cache to reduce image size
