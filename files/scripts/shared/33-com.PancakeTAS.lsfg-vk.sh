#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
dnf5 install -y  git clang llvm cmake ninja-build spirv-headers-devel vulkan-headers vulkan-loader-devel
git clone --recurse-submodules --depth 1 https://github.com/PancakeTAS/lsfg-vk.git  /sources/com.github.PancakeTAS.lsfg-vk
(cd /sources/com.github.PancakeTAS.lsfg-vk;cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release  -DCMAKE_INSTALL_PREFIX=/usr)
(cd /sources/com.github.PancakeTAS.lsfg-vk;cmake --build build)
(cd /sources/com.github.PancakeTAS.lsfg-vk;cmake --install build)
dnf5 remove -y ninja-build spirv-headers-devel vulkan-headers vulkan-loader-devel
