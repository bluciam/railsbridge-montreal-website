source 'https://rubygems.org'
ruby '2.5.1'

gem 'rails', '~> 5.1'
gem 'memcachier'
gem 'dalli'
gem 'kgio'
gem 'rack-cache'

gem 'bourbon'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'responders', '~> 2.0'
gem 'route_translator'
gem 'sass-rails'
gem 'simple_form'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'exception_notification'
gem 'gibbon' # for mailchimp

group :production do
  gem 'unicorn'
  gem 'heroku-deflater'
  gem 'rails_12factor'
  gem 'pg'
end

group :development do
  gem 'brakeman', :require => false
  gem 'letter_opener'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
end

group :development, :test do
  gem 'better_errors'
  gem 'pry'
  gem 'listen'
end
