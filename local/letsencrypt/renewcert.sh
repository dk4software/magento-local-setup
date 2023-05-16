#! /bin/bash

set -o errexit

ROOTFOLDER="$(readlink -f ./)"

sudo docker run -it --rm \
-v "${ROOTFOLDER}"/etc:/etc/letsencrypt \
-v "${ROOTFOLDER}"/lib:/var/lib/letsencrypt \
-v "${ROOTFOLDER}"/letsencrypt-site:/data/letsencrypt \
-v "${ROOTFOLDER}/log:/var/log/letsencrypt" \
certbot/certbot \
renew --webroot \
--webroot-path=/data/letsencrypt
