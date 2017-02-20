source 'https://rubygems.org'

gem 'json'
# gem 'nokogiri'
gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'

gem 'sequel'
gem 'sequel-seed'

# gem 'sinatra-contrib'
gem 'rack'#, '<2.0'
gem 'rake'
gem 'pg'
gem 'haml'
gem 'dotenv'

group :development, :test do
  gem 'byebug', platform: :mri # https://github.com/deivid-rodriguez/byebug
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner'#, '~> 1.2.0'
  gem 'rspec' #, '~> 2.14.1'
  gem 'capybara'#, '~> 2.2.1'
  gem 'rerun'#, '~> 0.9.0'
  gem 'launchy'#, '~> 2.4.2'
end
