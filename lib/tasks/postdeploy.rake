namespace :postdeploy do
  desc 'Runs any one-time setup tasks that make the app ready for review'
  task run: :environment do
    sh 'bundle exec rake db:schema:load'
    sh 'cat ./db/pg_backups/lets_fish_review.dump | psql $DATABASE_URL'
    sh 'bundle exec rake db:migrate'
  end
end