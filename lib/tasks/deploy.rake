namespace :deploy do
  desc 'Builds and deploys to Heroku like Codeship'
  task heroku: :environment do
    sh 'bundle install'
    sh 'RAILS_ENV=test bundle exec rake db:schema:load'
    sh 'RAILS_ENV=test bundle exec rake db:migrate'
    sh 'RAILS_ENV=test bundle exec rspec'
    sh 'git push heroku'
    Bundler.with_clean_env { sh 'heroku run rake assets:precompile --trace' }
    Bundler.with_clean_env { sh 'heroku run rake db:migrate --trace' }
    Bundler.with_clean_env { sh 'heroku restart' }
  end
end
