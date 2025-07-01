#!/usr/bin/env bash
set -u
set -o pipefail
set -x
TARGET="/usr/share/applications/mimeapps.list"
APP_AUDIO="org.gnome.Decibels.desktop"
APP_VIDEO="com.github.rafostar.Clapper.desktop"
APP_IMAGE="org.gnome.Loupe.desktop"
MIME_AUDIO_DIR="/usr/share/mime/audio"
MIME_VIDEO_DIR="/usr/share/mime/video"
MIME_IMAGE_DIR="/usr/share/mime/image"
if [[ $EUID -ne 0 ]]; then
  echo "Run this script as root."
  exit 1
fi
if [[ ! -f "$TARGET" ]]; then
  echo "[Default Applications]" > "$TARGET"
fi
if ! grep -q "^\[Default Applications\]" "$TARGET"; then
  echo -e "\n[Default Applications]" >> "$TARGET"
fi
extract_mimetypes() {
  local dir="$1"
  local prefix="$2"
  find "$dir" -type f -name '*.xml' \
    | sed -E "s|.*/||; s/\.xml$//; s|^|$prefix/|" \
    | sort -u
}
set_default_app() {
  local mime="$1"
  local app="$2"
  if grep -q "^$mime=" "$TARGET"; then
    sed -i "s|^$mime=.*|$mime=$app|" "$TARGET"
  else
    sed -i "/^\[Default Applications\]/a $mime=$app" "$TARGET"
  fi
}
AUDIO_MIMETYPES=$(extract_mimetypes "$MIME_AUDIO_DIR" "audio")
for mime in $AUDIO_MIMETYPES; do
  set_default_app "$mime" "$APP_AUDIO"
done
VIDEO_MIMETYPES=$(extract_mimetypes "$MIME_VIDEO_DIR" "video")
for mime in $VIDEO_MIMETYPES; do
  set_default_app "$mime" "$APP_VIDEO"
done
IMAGE_MIMETYPES=$(extract_mimetypes "$MIME_IMAGE_DIR" "image")
for mime in $IMAGE_MIMETYPES; do
  set_default_app "$mime" "$APP_IMAGE"
done
