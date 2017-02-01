FROM ruby:2.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ADD . /lets-fish
WORKDIR /lets-fish
RUN bundle install
CMD ["rails","server","-b","0.0.0.0"]

