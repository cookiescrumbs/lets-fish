namespace :pg_db do
  desc "Creates a Postgres SQL db dump & a compressed db dump in /db/pg_backups"
  task dump: :environment do
    `pg_dump --verbose  --no-acl --no-owner -h localhost -d lets_fish_development > ./db/pg_backups/lets_fish_development`
    `pg_dump -Fc --no-acl --no-owner -h localhost lets_fish_development > ./db/pg_backups/lets_fish_development.dump`
  end

  desc "Restore development db (data only) from /db/pg_backups"
  task restore: :environment do
    `pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development ./db/pg_backups/lets_fish_development.dump`
  end

  desc "Start Postgres"
  task start: :environment do
     `pg_ctl -D /usr/local/var/postgres -l logfile start`
  end

  desc "Create and load the development database"
  task create_development: :environment do
    sh 'RAILS_ENV=development bundle exec rake db:create'
    sh 'RAILS_ENV=development bundle exec rake db:schema:load'
  end


  desc "Create and load the test database"
  task create_test: :environment do
    sh 'RAILS_ENV=test bundle exec rake db:create'
    sh 'RAILS_ENV=test bundle exec rake db:schema:load'
  end



end
