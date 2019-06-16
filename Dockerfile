FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /order_app

WORKDIR /order_app

COPY Gemfile /order_app/Gemfile
COPY Gemfile.lock /order_app/Gemfile.lock

RUN bundle install

COPY . /order_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]