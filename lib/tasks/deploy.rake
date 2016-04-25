namespace :deploy do
  desc "Builds and deploys to Heroku like Codeship"
  task :heroku, [:commit_id] do |t, args|
    fail "A git commit id is required" unless args.commit_id
    sh 'bundle install'
    sh 'RAILS_ENV=test bundle exec rake db:schema:load'
    sh 'RAILS_ENV=test bundle exec rake db:migrate'
    sh 'RAILS_ENV=test bundle exec rspec'
    sh "git push heroku_lets-fish #{args.commit_id}:refs/heads/master"
    sh 'heroku run rake db:migrate'
    sh 'heroku restart'
  end
end
