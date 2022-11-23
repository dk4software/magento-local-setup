#!/bin/bash
set -o errexit

# install sample data
bin/magento sampledata:deploy

bin/magento module:enable --all #sometimes sample data modules don't get enabled.

bin/composer require markshust/magento2-module-disabletwofactorauth

bin/magento module:enable MarkShust_DisableTwoFactorAuth

bin/magento setup:upgrade

bin/magento config:set twofactorauth/general/enable 0

bin/magento setup:upgrade && bin/magento setup:di:compile && bin/magento setup:static-content:deploy -f && bin/magento indexer:reindex && bin/magento cache:flush && bin/magento cache:clean

bin/magento admin:user:create --admin-user=admin --admin-password=Hello123 --admin-email=admin@example.org --admin-firstname=Admin --admin-lastname=Admin