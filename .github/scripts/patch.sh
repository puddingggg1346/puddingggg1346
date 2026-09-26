#!/bin/bash
set -e
cd jdk-src
# 修复Bionic不支持的pthread函数
sed -i 's/#define HAVE_PTHREAD_CANCEL 1/#undef HAVE_PTHREAD_CANCEL/' make/autoconf/platform.m4 || true

# 禁用部分Linux-only代码
find src/hotspot/os/linux -name "*.cpp" -exec \
  sed -i 's/#include <sys\/sysinfo.h>/\/* removed *\//' {} \; 2>/dev/null || true
