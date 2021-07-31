# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="weston"
PKG_VERSION="25296db20a6f46939286237782c94048387fbee9"
PKG_SHA256=""
PKG_LICENSE="OSS"
PKG_SITE="https://wayland.freedesktop.org/"
#PKG_URL="https://wayland.freedesktop.org/releases/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_URL="https://gitlab.freedesktop.org/wayland/weston.git"
PKG_DEPENDS_TARGET="toolchain wayland-protocols libdrm libxkbcommon libinput cairo libjpeg-turbo dbus"
PKG_LONGDESC="Reference implementation of a Wayland compositor"

PKG_MESON_OPTS_TARGET="	   -Dimage-webp=false \
			   -Dbackend-drm=true \
			   -Dxwayland=false \
			   -Dbackend-headless=false \
			   -Dbackend-rdp=false \
			   -Dscreenshare=false \
			   -Dbackend-wayland=false \
			   -Dbackend-fbdev=false \
			   -Dsystemd=true \
			   -Dweston-launch=false \
			   -Dbackend-drm-screencast-vaapi=false\
			   -Dcolor-management-lcms=false \
			   -Dcolor-management-colord=false \
			   -Dremoting=false \
			   -Dpipewire=false \
			   -Ddemo-clients=false \
			   -Dshell-fullscreen=true \
			   -Dbackend-x11=false"


post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/weston
    cp $PKG_DIR/scripts/weston-config $INSTALL/usr/lib/weston

  mkdir -p $INSTALL/usr/share/weston
    cp $PKG_DIR/config/weston.ini $INSTALL/usr/share/weston

  rm -r $INSTALL/usr/share/wayland-sessions
  rm -r $INSTALL/usr/lib/weston-simple-im
}

post_install() {
  enable_service weston.service
}
