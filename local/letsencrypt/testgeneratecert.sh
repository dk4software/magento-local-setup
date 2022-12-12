#! /bin/bash

set -o errexit

DOMAIN=${1:-local-magento-test.net}

ROOTFOLDER="$(readlink -f ./)"

sudo docker run -it --rm \
-v "${ROOTFOLDER}"/etc:/etc/letsencrypt \
-v "${ROOTFOLDER}"/lib:/var/lib/letsencrypt \
-v "${ROOTFOLDER}"/letsencrypt-site:/data/letsencrypt \
-v "${ROOTFOLDER}/log:/var/log/letsencrypt" \
certbot/certbot \
certonly --webroot \
--register-unsafely-without-email --agree-tos \
--webroot-path=/data/letsencrypt \
--staging \
-d "${DOMAIN}"
