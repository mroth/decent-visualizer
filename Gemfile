# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "active_link_to"
gem "aws-sdk-s3", require: false
gem "bootsnap", require: false
gem "cloudinary"
gem "dalli"
gem "debug"
gem "devise", github: "heartcombo/devise"
gem "doorkeeper"
gem "ferrum"
gem "image_processing"
gem "importmap-rails"
gem "kramdown"
gem "kramdown-parser-gfm"
gem "memoist"
gem "mini_magick"
gem "pagy"
gem "pg"
gem "propshaft"
gem "puma"
gem "rails", "~> 7.0.0"
gem "redis"
gem "responders", github: "heartcombo/responders"
gem "rollbar"
gem "sidekiq"
gem "sidekiq-scheduler"
gem "slim"
gem "stimulus-rails"
gem "stripe"
gem "tailwindcss-rails"
gem "tickly", github: "miharekar/tickly"
gem "turbo-rails"

group :development, :test do
  gem "dotenv-rails"
end

group :development do
  gem "annotate"
  gem "app_profiler"
  gem "brakeman"
  gem "foreman", require: false
  gem "guard"
  gem "guard-minitest"
  gem "letter_opener"
  gem "listen"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console"
end
