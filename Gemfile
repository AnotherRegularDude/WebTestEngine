source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'faker'
gem 'hashie'
gem 'oj'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rabl'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.1.5'
gem 'redis-rails'
gem 'virtus'
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'

  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'selenium-webdriver'

  # Rspec stuff
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'foreman', require: false

  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'database_cleaner', group: :test
