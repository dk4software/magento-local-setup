# Setup of Magento

## Requirements

- Same as [https://github.com/markshust/docker-magento#prerequisites](https://github.com/markshust/docker-magento#prerequisites)

## Installation of Magento with Sample data

- Run the command: `curl -s https://raw.githubusercontent.com/dk4software/magento-local-setup/setup/start | bash -s -- <domain> <version> <edition>`

E.g. `curl -s https://raw.githubusercontent.com/dk4software/magento-local-setup/setup/start | bash -s -- local-magento-test.net 2.4.5-p1 community`

This will install the following:

- Setup docker using [https://github.com/markshust/docker-magento](https://github.com/markshust/docker-magento)
- Install Magento sample data.
- Disable 2FA after installing the module: [https://github.com/markshust/magento2-module-disabletwofactorauth](https://github.com/markshust/magento2-module-disabletwofactorauth)
- Create an admin user with details in [local/mftf/env/.env.sample](local/mftf/env/.env.sample)

## Generate SSL Certificates

- Stop the main server docker instances: `bin/stop`
- Go to letsencrypt folder: `cd letsencrypt/`
- Bring up the temp nginx server for generating SSL: `docker-compose up -d`
- Test the SSL generation: `./testgeneratecert.sh <domain name>`
- If test generation is success, clear all generated files for test: `sudo rm -rf etc/*`
- Generate the actual SSL certificates (email will be given to Letsencrypt): `./generatecert.sh <domain name> <email>`
- If generation is successful bring down the temp Nginx server: `docker-compose stop`
- Start the main server instances: `cd .. && bin/start`
- Run the command to configure the generated SSL: `bin/setssl <domain name>`

## Set Password for Nginx

- Run the command: `bin/setnginxpwd <user name>`
- Provide password and confirmation on prompting.

## Setup MFTF

- Update the information in [local/mftf/env/.env.sample](local/mftf/env/.env.sample). This will be used for setting up MFTF.
- Run the command; `bin/setupMFTFServer`

It will run `bin/mftf doctor` in the end. You will see if there are any issues.

You can now start generating and running tests using bin/mftf.
