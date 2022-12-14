# Setup of Magento

## Requirements

- Same as [https://github.com/markshust/docker-magento#prerequisites](https://github.com/markshust/docker-magento#prerequisites)
- **Make sure that your github account has your machine's ssh key.**

## Installation of Magento with Sample data and disable 2FA

- Create a folder which will be the docker project root.
- Run the command: `curl -s https://raw.githubusercontent.com/dk4software/magento-local-setup/master/start | bash -s -- <domain> <version> <edition>`

E.g. `curl -s https://raw.githubusercontent.com/dk4software/magento-local-setup/master/start | bash -s -- local-magento-test.net 2.4.5-p1 community`

This will install the following:

- Setup docker using [https://github.com/markshust/docker-magento](https://github.com/markshust/docker-magento)
- Install Magento sample data.
- Disable 2FA after installing the module: [https://github.com/markshust/magento2-module-disabletwofactorauth](https://github.com/markshust/magento2-module-disabletwofactorauth)
- Create an admin user with details in [local/mftf/env/.env.sample](local/mftf/env/.env.sample)

## After installation of Magento with sample data, you can do any of the below tasks

- Setup MFTF:`bin/setupMFTFServer`. If needed, update the information in [local/mftf/env/.env.sample](local/mftf/env/.env.sample). This will be used for setting up MFTF. `bin/mftf doctor` will be executed in the end. You will see if there are any issues. You can now start generating and running tests using bin/mftf.
- Test generation of SSL Certificates (**only for Magento server**): `bin/testgenssl <domain name>`
- Generate SSL Certificates (**only for Magento server**): `bin/genssl <domain name> <email>`
- Set Password for Nginx: `bin/setnginxpwd <user name>`. Provide password and confirmation password on prompting.
