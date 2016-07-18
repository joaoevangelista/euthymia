FROM ruby:2.3-slim

MAINTAINER João Pedro Evangelista <joaoevangelista@protonmail.com>

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev \
 postgresql-client-9.4 --fix-missing --no-install-recommends

ENV RAILS_PORT 3000
ENV PORT 80
ENV RAILS_ENV production
ENV INSTALL_DIR /stronghold

# Install and configure nginx
RUN apt-get install -y nginx
RUN rm -rf /etc/nginx/sites-available/default
ADD container/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p $INSTALL_DIR

WORKDIR $INSTALL_DIR

COPY Gemfile Gemfile

RUN gem install bundler rake foreman && bundle install --without development test

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_KEY_BASE=pickasecuretoken assets:precompile

# Migrating database
# If you want to migrate and seed, attach the container and execute 'bundle exec rake db:seed'
# bundle exec rake SECRET_KEY_BASE=pickasecuretoken db:create db:migrate

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

EXPOSE $RAILS_PORT
EXPOSE $PORT

# The default command that gets ran will be to start the Unicorn server.
# CMD bundle exec unicorn -c config/unicorn.rb
CMD ["foreman", "start"]

# WARNING: You need a SECRET_KEY_BASE env set when you run the container
