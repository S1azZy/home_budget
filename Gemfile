# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "aasm"
gem "anyway_config", "~> 2.0"
gem "bcrypt"
gem "bootsnap", require: false
gem "brakeman", require: false
gem "bundler-audit", require: false
gem "cssbundling-rails"
gem "devise"
gem "font-awesome-sass"
gem "haml"
gem "haml-rails"
gem "importmap-rails"
gem "oj"
gem "pagy"
gem "pg"
gem "puma"
gem "rails", "~> 7.0.4"
gem "rails-i18n", "~> 7.0"
gem "redis"
gem "rubocop", require: false
gem "rubocop-performance", require: false
gem "rubocop-rails", require: false
gem "rubocop-rspec", require: false
gem "sprockets-rails"
gem "stimulus-rails"
gem "terser", "~> 1.1"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 6.0.0"
  gem "shoulda-matchers"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "ffaker"
  gem "selenium-webdriver"
  gem "simplecov", require: false

  gem "webdrivers"
end
