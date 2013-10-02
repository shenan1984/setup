#!/bin/bash
# Clone MEAN stack
git pull https://github.com/linnovate/mean.git
# sudo apt-get install mongodb-clients

# Install packages and bower
npm install
npm install -g bower
bower install

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Set up heroku
heroku create
ssh-keygen -t rsa
heroku keys:add
heroku plugins:install git://github.com/ddollar/heroku-config.git
heroku addons:add papertrail
heroku addons:add mongohq:sandbox
heroku config | grep "MONGOHQ"

# Set up heroku configuration variables
# https://devcenter.heroku.com/articles/config-vars
# - Modify the .env.dummy file, and DO NOT check .env into the git repository.
# - See .env.dummy for details.
cp $HOME/dotfiles/.env.dummy .env

