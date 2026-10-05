#!/bin/bash

DIR="/var/www/M4_DS_PREFIX"
NGINX_ONLYOFFICE_PATH="/etc/M4_DS_PREFIX/nginx"

cd ${DIR}
# (Re)compress only what changed since its .gz was made (an update or a rebuild replaces the
# file but leaves its old .gz, which gzip_static would keep serving), on all cores.
# gzip -k gives the .gz the mtime of its source: up to date = same mtime, not newer.
gzip_stale() {
  xargs -0 -r -n 64 -P "$(nproc)" sh -c 'for f; do [ -e "$f.gz" ] && ! [ "$f" -nt "$f.gz" ] || gzip -kf9 "$f"; done' _
}

# Make gziped scripts
find ./sdkjs ./web-apps ./sdkjs-plugins ./dictionaries -type f \( -name '*.js' -o -name '*.json' -o -name '*.htm' -o -name '*.html' -o -name '*.css' -o -name '*.bin' -o -name '*.wasm' -o -name '*.dic' -o -name '*.aff' -o -name '*.svg' \) -print0 | gzip_stale

# Make gziped fonts
find ./fonts -type f ! -name "*.*" -print0 | gzip_stale

# Turn on static gzip for nginx
sed 's/#*\s*\(gzip_static\).*/\1 on;/g' \
  -i ${NGINX_ONLYOFFICE_PATH}/includes/ds-docservice.conf

# Reload nginx config
[ $(pgrep -x ""systemd"" | wc -l) -gt 0 ] && systemctl reload nginx || service nginx reload
