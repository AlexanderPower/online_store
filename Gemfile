source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.1'
gem 'therubyracer', platforms: :ruby

# DB
gem 'sqlite3'

# Users
gem 'devise'
gem 'cancancan', '~> 1.10'

# JSON
gem 'jbuilder', '~> 2.0'

# Docs
gem 'sdoc', '~> 0.4.0', group: :doc

# Front-end
gem 'uglifier', '>= 1.3.0'
gem 'less-rails'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0.1'
gem 'simple_form'
gem 'jquery-turbolinks'
#gem 'best_in_place', '~> 3.0.1'
#gem 'tinymce-rails', '~> 4.1.6'

# Files upload
gem 'paperclip', '~> 4.2'
gem 'aws-sdk', '< 2.0'

group :development do
  gem 'erb2haml'
end

# Test
group :test do
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.3.6'
end

# Production
group :production do
  # gem 'puma'
  gem 'rails_12factor'
  gem 'pg'
end