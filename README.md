# Setup of Magento

## Installation of Magento with Sample data

- Run the command:
`curl -s https://raw.githubusercontent.com/dk4software/magento-local-setup/master/start | bash -s -- local-magento-test.net 2.4.5-p1 community`

## Generate SSL Certificates

- Stop the main server docker instances: `bin/stop`
- Go to letsencrypt folder: `cd letsencrypt/`
- Bring up the temp nginx server for generating SSL: `docker-compose up -d`
- Test the SSL generation: `./testgeneratecert.sh <domain name>`
- If test generation is success, clear all test generated files: `sudo rm -rf etc/*`
- Generate the actual SSL certificates: `./generatecert.sh <domain name> <email>`
- If generation is successful bring down the temp Nginx server: `docker-compose stop`
- Edit the nginx configuration in nginx/default.conf, comment the self signed certificate, uncomment the SSL certificate and rename the domain name in the certificate path.
- Start the main server instances: `bin/start`
- Fix permission issues: `bin/fixowns && bin/fixperms`
- Restart app server: `bin/restart app`

## Set Password for Nginx

- Run the command: `bin/setnginxpwd`
- In the new prompt, run the command: `bin/setnginxpwd <username>`
- Provide password and confirmation on prompting.
- Exit the commandline: `exit`
