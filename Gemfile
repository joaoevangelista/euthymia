# frozen_string_literal: true
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'rails-assets-tether', '>= 1.1.0', source: 'https://rails-assets.org/'
gem 'font-awesome-sass', '~> 4.6.2'
# https://github.com/bluerail/twitter-bootstrap-rails-confirm
gem 'twitter-bootstrap-rails-confirm'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'

# Authorization
gem 'pundit'

# Human Data Analysis
gem 'indico'
# Mardkown Parser
gem 'redcarpet'
# Emojione
gem 'gemojione'
# Dependency for performance of gemojione
gem 'escape_utils'
# Use Redis Store to cache and session storage
gem 'redis-rails'
# Language selector
gem 'http_accept_language'

# Cloudinary
gem 'carrierwave'
gem 'cloudinary'
# Notifications
gem 'exception_notification'
# Health Status
gem 'health_check'
# APIs
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'rack-cors', :require => 'rack/cors'
# API Authentication
gem 'doorkeeper'
# OAuth 2 Guard on Resource Server (API)
gem "rack-oauth2", "~> 1.0.5"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'dotenv-rails'
end

group :test do
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem 'win32console' if Gem.win_platform?
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
