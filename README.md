setup.git
=========
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
curl https://raw.github.com/shenan1984/setup/master/setup.sh | sh

# Load nvm and install latest production node
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.



## MEAN stack installation notes
After setup, **LOGOUT** then **LOGIN**. Then create a new Project install packages, bower, and configure git and heroku.
```sh
# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.20
nvm use v0.10.20

# setup github repo first if needed
mkdir $HOME/"Project"; cd "Project"
git config --global user.name "Your Name Here"
git config --global user.email "your_email@example.com"
git init
git remote add origin https://github.com/"user/repo".git
heroku login

curl https://raw.github.com/shenan1984/setup/master/mean_stack.sh | sh
```

Push to git and heroku
```sh
git add .
git add -f public/lib
git push origin master
git push heroku master
heroku config:push
```
Add SSH Key if necessary: https://help.github.com/articles/generating-ssh-keys

Configure MongoHQ from a browser:
* Add first user.  (Apart from default heroku)

Then use ``mongodb://<user>:<password>@paulo.mongohq.com:10088/<app_name>``:
* Update MONGOHQ_URL in .env
* Update development:{db} in config/config.js
