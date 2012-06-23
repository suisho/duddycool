#!/bin/sh

git pull
cd rails
bundle install
rake db:migrate
cd ../
sudo service apache2 graceful
