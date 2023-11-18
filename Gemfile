# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.1'

##-- Base Gems for Rails --##
gem 'rails', '~> 7.1.1'
gem 'bootsnap', require: false # Reduces boot times through caching; required in config/boot.rb

##-- Hotwire & Frontend --##
gem 'importmap-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

##-- Sprockets --##
gem 'sprockets-rails'

##-- Rails Application Helper Gems --##
gem 'jbuilder'

##-- Gems for Database --##
gem 'pg', '~> 1.1'
gem 'redis', '>= 4.0.1'

##--- Server & Infrastructure Configuration ---##
gem 'puma', '>= 5.0'

##-- Authentication & Authorization --##
gem 'devise', '~> 4.9', '>= 4.9.3'

##-- Active Storage --##
gem 'aws-sdk-s3', require: false

##-- Platform Specific Gems --##
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end
