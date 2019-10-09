#!/bin/sh

#ANDROID_EMULATOR_EXTRA_ARGS="-skin 1080x1920 -memory 2048 -gpu guest -no-boot-anim -qemu -vnc :0"
ANDROID_EMULATOR_EXTRA_ARGS="-skin 1080x1920 -memory 2048 -gpu host -no-boot-anim -qemu"
ANDROID_AVD_EXTRA_ARGS="--device 8 --force"
docker run --privileged -it -p 6080:6080 -e ANDROID_AVD_EXTRA_ARGS="${ANDROID_AVD_EXTRA_ARGS}" -e ANDROID_EMULATOR_EXTRA_ARGS="${ANDROID_EMULATOR_EXTRA_ARGS}" --name android-emulator --rm $1
