#!/bin/bash
set -e
NDK_TOOLCHAIN="$NDK/toolchains/llvm/prebuilt/linux-x86_64"
SYSROOT="$NDK_TOOLCHAIN/sysroot"
TARGET=aarch64-linux-android
API=26

export CC="$NDK_TOOLCHAIN/bin/${TARGET}${API}-clang"
export CXX="$NDK_TOOLCHAIN/bin/${TARGET}${API}-clang++"
export AR="$NDK_TOOLCHAIN/bin/llvm-ar"
export STRIP="$NDK_TOOLCHAIN/bin/llvm-strip"
export BUILD_CC=clang
export BUILD_CXX=clang++
export PATH="$BOOT_JDK/bin:$PATH"

bash configure \
  --openjdk-target=$TARGET \
  --with-sysroot=$SYSROOT \
  --with-toolchain-type=clang \
  --with-build-cc=clang \
  --with-build-cxx=clang++ \
  --with-boot-jdk=$BOOT_JDK \
  --with-devkit=$NDK_TOOLCHAIN \
  --with-extra-cflags="-fPIC -D__ANDROID_API__=$API -O2" \
  --with-extra-cxxflags="-fPIC -D__ANDROID_API__=$API -O2" \
  --with-extra-ldflags="-fuse-ld=lld -Wl,-z,max-page-size=16384" \
  --disable-warnings-as-errors \
  --enable-headless-only \
  --with-jvm-variants=server \
  --with-jvm-features=-jvmti \
  --with-native-debug-symbols=none \
  --disable-javac-server \
  --with-version-pre="" \
  --with-vendor-name="MCL" \
  --with-vendor-url="https://github.com" \
  --with-vendor-bug-url="https://github.com" \
  --with-vendor-vm-bug-url="https://github.com"
