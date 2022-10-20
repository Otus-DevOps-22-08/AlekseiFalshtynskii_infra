#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update && apt-get install -y ruby-full ruby-bundler build-essential mongodb-org git
sudo systemctl enable mongod
sudo systemctl start mongod
cd /opt
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service
sudo systemctl start puma.service
