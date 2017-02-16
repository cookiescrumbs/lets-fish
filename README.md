![](https://codeship.com/projects/43375cc0-abc3-0133-9b76-02e6183d343a/status?branch=master)

Let's Fish
================

A website for finding places to go fly fishing.

##Getting your development machine setup

```
git clone .....
```
### Install ruby using RVM

http://stackoverflow.com/questions/15212104/ruby-openssl-issues-on-mac

This is a fix for the openssl problem with RVM compiled rubies

```
rvm get stable
brew install libyaml
rvm pkg install openssl
rvm osx-ssl-certs update all
rvm install ruby-2.3.1--with-openssl-dir=$HOME/.rvm/usr --disable-binary
```
###Setting up your Postgres DB

#####Install Postgres via brew
```
psql --version
brew install postgresql
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

```
[More information about installing Postgres for Rails](http://railscasts.com/episodes/342-migrating-to-postgresql)

#####Start Postgres
```
bundle exec rake pg_db:start
```

#####Create development and test db

```
bundle exec rake pg_db:create_development #create and load the dev db
bundle exec rake pg_db:create_test #create and load the test db

```
#####Add some development data to your database
```
bundle exec rake pg_db:restore #Restore development db (data only) from /db/pg_backups (using "live" data)

```

#####Setup Heroku

[Download the toolbelt](https://toolbelt.heroku.com/)

```
heroku git:remote -a lets-fish #add Heroku remote to git repo
```

####Restore DB from dump

```
pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development ~/Desktop/lets-fish-22-37.dump```

```
rake pg_db:restore  # Restore development db (data only) from /db/pg_backups
```

Use ```rake pg_db:restore ``` locally to add test data to your dev app. It grabs the data from from /db/pg_backups.
I'll periodically backup the directory with live data. So you should have somthing similiar to "live".

###Removes DB config

Removed so I can run the app in production on my dev machine without having to alert this file or worry about it.
I can precompile my production assets and debug locally.
Heroku was swtiching the asset folder from ```/assets ``` to ```/shared/assets```

```
RAILS_ENV=production bundle exec rake assets:clobber
RAILS_ENV=production bundle exec rake assets:precompile
```
```
RAILS_ENV=production bundle exec rails s
```

######Docker Compose

### Build

```
docker-compose build

```

### Database setup

```
docker-compose run web bundle exec rake db:create db:schema:load
docker exec -i $(docker-compose ps -q db) pg_restore --verbose --no-acl --no-owner -U postgres -h db --data-only -d lets_fish_development < ./db/pg_backups/lets_fish_development.dump
```


### Run container

```
docker-compose up
```
