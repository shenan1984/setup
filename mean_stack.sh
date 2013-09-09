#!/bin/bash

# Install packages and bower
npm install
npm install -g bower
bower install

# Set up heroku
heroku login
heroku create
ssh-keygen -t rsa
heroku keys:add
heroku addons:add papertrail
heroku addons:add mongohq:sandbox
heroku config | grep "MONGOHQ"

# Set up heroku configuration variables
# https://devcenter.heroku.com/articles/config-vars
# - Edit .env to include your own COINBASE_API_KEY and HEROKU_POSTGRES_URL.
# - Modify the .env.dummy file, and DO NOT check .env into the git repository.
# - See .env.dummy for details.
cp $HOME/dotfiles/.env.dummy $HOME/mean/.env

# Reminder to set up git
# STRING=$( cat <<EOF
# Now configure github using the following lines.\n\n
# 1) git config --global user.name "Your Name Here"
# 2) git config --global user.email "your_email@example.com"
# 3) git remote rm origin
# 4) git remote add origin git@github.com:Your_Username/New_Project_Name.git
# 5) git add -f public/lib
# EOF
# )
