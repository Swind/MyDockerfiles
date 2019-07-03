FROM ubuntu:18.04

# ================================================ 
# Android SDK
#
# ================================================
RUN dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install -y --no-install-recommends libncurses5:i386 libc6:i386 libstdc++6:i386 lib32gcc1 lib32ncurses5 lib32z1 zlib1g:i386 \
 && apt-get install -y --no-install-recommends file git curl unzip zip sudo\
 && apt-get install -y --no-install-recommends openjdk-8-jdk \
 && apt-get install -y --no-install-recommends supervisor \
 && apt-get install -y libqt5widgets5 socat net-tools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists /var/cache/apt

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Create a non-root user
RUN mkdir -p /root
WORKDIR /root
ENV ANDROID_HOME="/root/android-sdk-linux"

# Download Android SDK
ARG ANDROID_SDK_VERSION=4333796
ARG ANDROID_SDK_URL=https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip

RUN mkdir "$ANDROID_HOME" .android \
 && cd "$ANDROID_HOME" \
 && curl -o sdk.zip $ANDROID_SDK_URL \
 && unzip sdk.zip \
 && rm sdk.zip

ENV PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"

 # accept the license agreements of the SDK components
ADD scripts/license_accepter.sh /root/android-sdk-linux
RUN $ANDROID_HOME/license_accepter.sh $ANDROID_HOME

# ================================================
#
# Install noVNC 
#
# ================================================
RUN git clone https://github.com/novnc/noVNC.git \
 && cd noVNC \
 && git checkout v1.1.0 \
 && git clone https://github.com/novnc/websockify.git utils/websockify

# ================================================
#
# Install Android AVD and Emulator 
#
# ================================================
ENV ABI="x86_64" \
    TARGET="android-26" \
    TAG="google_apis" \
    NAME="Docker" \
    ANDROID_LOG_TAGS="e" \

    # Argument `-qemu -vnc :0` is required for VNC and noVNC to work
    # You can still override this variable: just add this argument to the end
    ANDROID_EMULATOR_EXTRA_ARGS="-skin 1080x1920 -memory 2048 -gpu swiftshader_indirect -no-boot-anim -qemu" \
    noVNC="false"

# Install android emulator
RUN mkdir -p $HOME/.android \
 && touch $HOME/.android/repositories.cfg \
 && yes yes | $ANDROID_HOME/tools/bin/sdkmanager --verbose \
        "tools" \
        "platform-tools" \
        "platforms;${TARGET}" \
        "system-images;${TARGET};${TAG};${ABI}"

ADD scripts/.emulator_console_auth_token /root
ADD scripts/socat.sh /root
ADD scripts/supervisord.conf /root
ADD scripts/entrypoint.sh /root

# android emulator ports
EXPOSE 5554 5555
ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]
