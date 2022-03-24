#!/bin/bash

git clone https://github.com/UrielOfir/bootcamp-app.git;

sudo apt install curl;
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash;
source ~/.profile;

nvm install 14;

cd bootcamp-app;
npm i;

echo "
# Host configuration
PORT=8080
HOST=10.0.2.5

# Postgres configuration
PGHOST=10.0.4.4
PGUSERNAME=postgres
PGDATABASE=postgres
PGPASSWORD=<postgres password>
PGPORT=5432

HOST_URL=http://<loadBalancerIP>:8080
COOKIE_ENCRYPT_PWD=superAwesomePasswordStringThatIsAtLeast32CharactersLong!
NODE_ENV=development

# Okta configuration
OKTA_ORG_URL=<oktaOrgUrl>
OKTA_CLIENT_ID=<oktaClientId>
OKTA_CLIENT_SECRET=<oktaClientSecret>
" > .env;

npm install pm2 -g;

pm2 startup;