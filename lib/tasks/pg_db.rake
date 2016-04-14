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

end
