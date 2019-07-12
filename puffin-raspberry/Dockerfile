FROM ubuntu:16.04

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt update \
    && apt install -y \
    acl adwaita-icon-theme at-spi2-core ca-certificates colord colord-data cpp cpp-5 dbus \
    dconf-gsettings-backend dconf-service dh-python distro-info-data file fontconfig fontconfig-config fonts-dejavu-core gcc-5-base glib-networking \
    glib-networking-common glib-networking-services gsettings-desktop-schemas hicolor-icon-theme humanity-icon-theme ifupdown iproute2 isc-dhcp-client \
    isc-dhcp-common krb5-locales libasound2 libasound2-data libatk-bridge2.0-0 libatk1.0-0 \
    libatk1.0-data libatm1 libatspi2.0-0 libauthen-sasl-perl libavahi-client3 libavahi-common-data libavahi-common3 libboost-filesystem1.58.0 \
    libboost-system1.58.0 libbsd0 libcairo-gobject2 libcairo2 libcap-ng0 libcapnp-0.5.3 libcolord2 \
    libcolorhug2 libcroco3 libcups2 libdatrie1 libdbus-1-3 libdconf1 libdns-export162 libdrm-amdgpu1 \
    libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libedit2 libegl1-mesa libelf1 libencode-locale-perl \
    libepoxy0 libexif12 libexpat1 libffi6 libfile-basedir-perl libfile-desktopentry-perl libfile-listing-perl libfile-mimeinfo-perl \
    libfont-afm-perl libfontconfig1 libfontenc1 libfreetype6 libgbm1 libgd3 libgdbm3 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common \
    libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglib2.0-0 libglib2.0-data libgmp10 libgnutls30 libgphoto2-6 libgphoto2-l10n libgphoto2-port12 \
    libgraphite2-3 libgssapi-krb5-2 libgtk-3-0 libgtk-3-bin libgtk-3-common libgudev-1.0-0 \
    libgusb2 libharfbuzz0b libhogweed4 libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl \
    libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl \
    libice6 libicu55 libidn11 libieee1284-3 libio-html-perl libio-socket-ssl-perl libipc-system-simple-perl libisc-export160 libisl15 \
    libjbig0 libjpeg-turbo8 libjpeg8 libjson-glib-1.0-0 libjson-glib-1.0-common libk5crypto3 libkeyutils1 \
    libkrb5-3 libkrb5support0 liblcms2-2 libllvm6.0 libltdl7 liblwp-mediatypes-perl liblwp-protocol-https-perl libmagic1 libmailtools-perl \
    libmirclient9 libmircommon7 libmircore1 libmirprotobuf3 libmnl0 libmpc3 libmpdec2 libmpfr4 \
    libnet-dbus-perl libnet-http-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnettle6 libnspr4 libnss3 libnss3-nssdb libp11-kit0 libpam-systemd \
    libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpciaccess0 libperl5.22 libpixman-1-0 \
    libpng12-0 libpolkit-agent-1-0 libpolkit-backend-1-0 libpolkit-gobject-1-0 libprotobuf-lite9v5 libproxy1v5 libpython3-stdlib libpython3.5-minimal \
    libpython3.5-stdlib librest-0.7-0 librsvg2-2 librsvg2-common libsane libsane-common \
    libsensors4 libsm6 libsoup-gnome2.4-1 libsoup2.4-1 libsqlite3-0 libssl1.0.0 libstdc++6 libsystemd0 libtasn1-6 libtext-iconv-perl libthai-data libthai0 \
    libtie-ixhash-perl libtiff5 libtimedate-perl libtxc-dxtn-s2tc0 liburi-perl \
    libusb-1.0-0 libvpx3 libwayland-client0 libwayland-cursor0 libwayland-egl1-mesa libwayland-server0 libwww-perl libwww-robotrules-perl libx11-6 libx11-data \
    libx11-protocol-perl libx11-xcb1 libxau6 libxaw7 libxcb-dri2-0 libxcb-dri3-0 \
    libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 libxext6 \
    libxfixes3 libxft2 libxi6 libxinerama1 libxkbcommon0 libxml-parser-perl \
    libxml-twig-perl libxml-xpathengine-perl libxml2 libxmu6 libxmuu1 libxpm4 libxrandr2 libxrender1 libxshmfence1 libxss1 libxt6 libxtables11 libxtst6 libxv1 \
    libxxf86dga1 libxxf86vm1 lsb-release mime-support netbase openssl perl perl-base \
    perl-modules-5.22 policykit-1 python3 python3-minimal python3.5 python3.5-minimal rename sgml-base shared-mime-info systemd \
    ubuntu-mono ucf wget x11-common x11-utils x11-xserver-utils xdg-user-dirs xdg-utils xkb-data xml-core xvfb fluxbox git curl tzdata locales\
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git fluxbox xclip sudo \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#===================
# Timezone settings
# Possible alternative: https://github.com/docker/docker/issues/3359#issuecomment-32150214
#===================
ENV TZ "UTC"
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata

#========================================
# Add normal user with passwordless sudo
#========================================
RUN useradd tester \
         --shell /bin/bash  \
         --create-home \
  && usermod -a -G sudo tester \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'tester:tester' | chpasswd
ENV HOME=/home/tester

#===================
# Set locale
#===================
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 

#======================================
# Add pyenv script
#======================================
WORKDIR /root
COPY install_pyenv.sh /root
RUN chmod +x /root/install_pyenv.sh & /root/install_pyenv.sh

