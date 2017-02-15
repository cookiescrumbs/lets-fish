FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for a js runtime
RUN apt-get install -y nodejs

ADD . /lets-fish
WORKDIR /lets-fish
RUN bundle install
CMD ["rails","server","-b","0.0.0.0"]
