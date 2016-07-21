# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_euthymia_session'
Rails.application.config.session_store :redis_store, servers: ENV['REDIS_URL'] || 'redis://redis:6379/0/session'
