source 'https://rubygems.org'

# Core
gem 'rails', '4.1.7'
gem 'sqlite3'

# Stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'              # Use Uglifier as compressor for JavaScript assets
gem 'font-awesome-sass'
gem 'bourbon'                           # Mixin library
gem 'neat'                              # Grid and media queries

# Javascript
gem 'coffee-rails', '~> 4.0.0'          # Use CoffeeScript for .js.coffee assets and views
gem 'therubyracer',  platforms: :ruby   # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'jquery-rails'                      # Use jquery as the JavaScript library

# Convenience
gem 'bcrypt', '~> 3.1.7'                # Use ActiveModel has_secure_password

#################################################
# Environments
#################################################

group :development, :test do
  gem 'spring'                          # See https://github.com/rails/spring
  gem 'byebug'                          # Call 'byebug' anywhere to stop and enter debugging console
end

group :production do
  gem 'unicorn'                         # Use unicorn as the app server
end
