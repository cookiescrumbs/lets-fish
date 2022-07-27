namespace :pg_db do
  desc 'Creates a Postgres SQL db dump & a compressed db dump in /db/pg_backups'

  desc 'Restore development db (data only) from /db/pg_backups'
  task restore: :environment do
    `pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development < ./db/pg_backups/lets_fish_development.dump`
  end

  desc 'Start Postgres'
  task start: :environment do
    `pg_ctl -D /usr/local/var/postgres -l logfile start`
  end

  desc 'Stop Postgres'
  task stop: :environment do
    `pg_ctl -D /usr/local/var/postgres -l logfile stop`
  end

  desc 'Create and load the development database'
  task create_development: :environment do
    sh 'RAILS_ENV=development bundle exec rake db:create'
    sh 'RAILS_ENV=development bundle exec rake db:schema:load'
  end

  desc 'Create and load the test database'
  task create_test: :environment do
    sh 'RAILS_ENV=test bundle exec rake db:create'
    sh 'RAILS_ENV=test bundle exec rake db:schema:load'
  end

  desc 'Clobber the DB. Restore the test and dev DB. Add fresh data from /db/pg_backups to the dev db'
  task clobber: :environment do
    sh 'bundle exec rake db:drop'
    sh 'bundle exec rake db:create'
    sh 'bundle exec rake db:schema:load'
    `pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development < ./db/pg_backups/lets_fish.dump`
  end
end
