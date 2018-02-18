
source 'https://rubygems.org'


git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
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

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use jquery as the JavaScript library
gem 'jquery-rails', ' >= 3.1.0'
gem 'jquery-ui-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platform: :mri
  gem 'rubocop', require: false
  gem 'rails_best_practices'
  gem 'rspec-rails', '~>3.7'
  gem 'factory_bot_rails'

  gem 'selenium-webdriver'
  # Use sqlite3 as the database for Active Record only for development or
  # testing
  gem 'sqlite3'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  # in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'gettext'
  gem 'get_pomo'
  gem 'annotate'
end

group :production do
  # Use postgresql for production, as it is required by heroku
  # gem 'ruby-pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'ckeditor'
gem 'devise'

# I18n
gem 'gettext_i18n_rails'

gem 'awesome_nested_set'

# Bootstrap 4.0 dependencies
gem 'font-awesome-sass', '~> 4.7.0'
gem 'sprockets-rails', '>= 2.3.2'
gem 'autoprefixer-rails', '>= 6.0.3'
gem 'popper_js', '< 2', '>= 1.12.9'
gem 'sass', '>= 3.5.2'
gem 'bootstrap', '~> 4.0'

gem "font-ionicons-rails"
gem 'octicons', '>=5.2.0'
gem 'octicons_helper', '~> 4.2'