source 'https://rubygems.org'
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# The ruby implementation of the GraphQL language.
gem 'graphql'

# A Ruby client library for Apache Kafka
gem 'ruby-kafka'
# Friendly and easy-to-approach Kafka consumer framework
gem 'racecar'

group :development, :test do
  # Seed data generator
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # A development utility to test GraphQL queries.
  gem 'graphiql-rails'
end

group :test do
  # Strategies for cleaning databases
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  # Fixtures replacement with a straightforward definition syntax
  gem 'factory_bot'
  # Testing framework for Ruby on Rails
  gem 'rspec-rails', '~> 3.8'
  # One-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  # Convenient rspec matchers for testing your graphql-ruby API/Schema
  gem 'rspec-graphql_matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
