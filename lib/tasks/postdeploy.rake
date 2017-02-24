namespace :postdeploy do
  desc 'Runs any one-time setup tasks that make the app ready for review'
  task run: :environment do
    sh 'bundle exec rake db:schema:load'
  end
end
