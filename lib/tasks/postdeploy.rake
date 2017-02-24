namespace :postdeploy do
  desc 'Runs any one-time setup tasks that make the app ready for review'
  task run: :environment do
    Bundler.with_clean_env { sh "heroku config:set HEROKU_APP_NAME=$(heroku info -s | grep web_url | cut -d. -f1 | cut -d: -f2 | sed 's/\/\///') && heroku pg:backups:restore lets-fish::b240 DATABASE_URL --app ENV['HEROKU_APP_NAME'] --confirm ENV['HEROKU_APP_NAME']"}
    sh "bundle exec rake db:migrate"
end
end