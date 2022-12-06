#! /bin/bash

DOMAIN=${1:-local-magento-test.net}
EMAIL=${2:-demo-mail@stripe.com}

ROOTFOLDER="$(readlink -f ./)"

sudo docker run -it --rm \
-v "${ROOTFOLDER}"/etc:/etc/letsencrypt \
-v "${ROOTFOLDER}"/lib:/var/lib/letsencrypt \
-v "${ROOTFOLDER}"/letsencrypt-site:/data/letsencrypt \
-v "${ROOTFOLDER}/log:/var/log/letsencrypt" \
certbot/certbot \
certonly --webroot \
--email "${EMAIL}" --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d "${DOMAIN}"
