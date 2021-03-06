FROM ruby:2.6.3

RUN apt-get update -qq && curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs postgresql-client \
  build-essential nodejs libpq-dev imagemagick git-all nano

RUN mkdir /app
COPY . /app

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV BUNDLE_PATH /gems
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]