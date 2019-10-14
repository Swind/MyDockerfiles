# Start

```
#!/bin/sh
ANDROID_EMULATOR_EXTRA_ARGS="-skin 1080x1920 -memory 2048 -gpu host -no-boot-anim -qemu"
ANDROID_AVD_EXTRA_ARGS="--device 8 --force"
docker run --privileged -it -p 6080:6080 -e ANDROID_AVD_EXTRA_ARGS="${ANDROID_AVD_EXTRA_ARGS}" -e ANDROID_EMULATOR_EXTRA_ARGS="${ANDROID_EMULATOR_EXTRA_ARGS}" --name android-emulator --rm
```

# Reference
[thedrhax-dockerfiles/android-sdk](https://github.com/thedrhax-dockerfiles/android-sdk)
[thedrhax-dockerfiles/android-avd](https://github.com/thedrhax-dockerfiles/android-avd)
[budtmo/docker-android](https://github.com/budtmo/docker-android)
[thyrlian/AndroidSDK](https://github.com/thyrlian/AndroidSDK)
