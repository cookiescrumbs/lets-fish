namespace :postdeploy do
  desc 'Runs any one-time setup tasks that make the app ready for review'
  task run: :environment do
    Bundler.with_clean_env { sh "heroku pg:backups:restore 'https://s3-eu-west-1.amazonaws.com/lets-fish/db-backups/820d2087-0f76-4b4f-a5bf-39fc0634fcb7' ENV['HEROKU_POSTGRESQL_BRONZE_URL'] --trace" }
    sh 'bundle exec rake db:migrate'
  end
end
