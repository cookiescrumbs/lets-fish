[ ![Codeship Status for cookiescrumbs/lets-fish](https://app.codeship.com/projects/4a75f140-62f5-0135-8d22-3601c9b40c24/status?branch=master)](https://app.codeship.com/projects/239994)

Let's Fish
================

A website for finding places to go fly fishing.



## Getting your development machine setup

### Install RVM

https://rvm.io/

### Create a Ruby environment using RVM

http://stackoverflow.com/questions/15212104/ruby-openssl-issues-on-mac

This is a fix for the openssl problem with RVM compiled rubies

```
rvm get stable
brew install libyaml
rvm pkg install openssl
rvm osx-ssl-certs update all
rvm install ruby-2.3.1 --with-openssl-dir=$HOME/.rvm/usr --disable-binary
```

### Install bundler to manage dependencies
```
gem install bundler
```

### Create the repository locally
```
git clone https://github.com/cookiescrumbs/lets-fish.git
```

### Install rails and other dependencies
```
bundle install
```

### Setting up your Postgres DB

##### Install Postgres via brew
```
psql --version
brew install postgresql
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

```
[More information about installing Postgres for Rails](http://railscasts.com/episodes/342-migrating-to-postgresql)

##### Start Postgres
```
bundle exec rake pg_db:start
```

##### Create development and test db
```
bundle exec rake pg_db:create_development #create and load the dev db
bundle exec rake pg_db:create_test #create and load the test db
```

##### Add some development data to your database
```
bundle exec rake pg_db:restore #Restore development db (data only) from /db/pg_backups (using "live" data)
```

##### Setup Heroku
[Download the toolbelt](https://toolbelt.heroku.com/)
```
heroku git:remote -a lets-fish #add Heroku remote to git repo
```

#### Restore DB from dump
```
pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development ~/Desktop/lets-fish-22-37.dump
```

```
rake pg_db:restore  # Restore development db (data only) from /db/pg_backups
```

Use ```rake pg_db:restore ``` locally to add test data to your dev app. It grabs the data from from /db/pg_backups.
I'll periodically backup the directory with live data. So you should have somthing similiar to "live".

### Removes DB config

Removed so I can run the app in production on my dev machine without having to alert this file or worry about it.
I can precompile my production assets and debug locally.

```
RAILS_ENV=production bundle exec rake assets:clobber
RAILS_ENV=production bundle exec rake assets:precompile
```

#### Example /config/database.yml
```
test: &test
  adapter: postgresql
  encoding: unicode
  database: lets_fish_test
  username: stevencook
  password:
  pool: 5
  timeout: 5000

development:
  adapter: postgresql
  encoding: unicode
  database: lets_fish_development
  username: stevencook
  password:
  pool: 5
  timeout: 5000

production:
  adapter: postgresql
  encoding: unicode
  database: lets_fish_development
  username: stevencook
  password:
  pool: 5
  timeout: 5000
```

### Running Let's Fish locally

Install the Foreman gem

```gem install foreman```

create a .env file for running locally

```
RAILS_SERVE_STATIC_FILES=false
RAILS_ENV=development
RACK_ENV=development
AWS_ACCESS_KEY_ID=xxxxxxxx
AWS_REGION=eu-west-1
AWS_SECRET_ACCESS_KEY=xxxxxx
S3_BUCKET_NAME=lets-fish
S3_REGION=eu-west-1
ASSET_HOST=dur8xuaowfaya.cloudfront.net
SECRET_KEY_BASE=xxxxxx
GEOGRAPH_API_KEY=xxxxx
DARK_SKY_API=xxxxx
GOOGLE_API_KEY_BROWSER=xxxxxx
INSTAGRAM_API_KEY=xxxx
```

Start Redis

```redis-server /usr/local/etc/redis.conf```

Start DB

```rake pg_db:start```

Start let's fish, run foreman from the root folder

```foreman start```

Foreman will pick up the .env file :)


![Alt text](https://ih0.redbubble.net/image.258461906.4511/sticker,375x360.u3.png "Member?")


Member when the assest pipeline couldn't find assets like Fonts?
Member?

### Asset pipeline
Member to use ``` asset_path () ``` and change the css file from ```.css to .css.erb```

```
@font-face {
    font-family: 'Glyphicons Halflings';
    src: url(<%= asset_path 'glyphicons-halflings-regular.eot' %>);
```

### Domain Model

[Domain model](https://github.com/cookiescrumbs/lets-fish/blob/master/erd.pdf)

###

### App requirements

proj is used to calculate and convert the lat,lng from a OS grid ref. It is a requirement of the global_convert gem, which is a requirement of the Northern Pike gem.

```brew install proj```

