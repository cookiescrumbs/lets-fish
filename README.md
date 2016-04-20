![](https://codeship.com/projects/43375cc0-abc3-0133-9b76-02e6183d343a/status?branch=master)

Let's Fish
================

An app to find, list and write guides to fisheries and waters.

####Restore DB from dump

```pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development ~/Desktop/lets-fish-22-37.dump```

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

####Example /config/data.yml
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
