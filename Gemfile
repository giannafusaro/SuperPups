source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core
gem "rails", "~> 5.0.1"     # A full-stack web framework optimized for programmer happiness
gem "sqlite3"               # Use sqlite3 as the database for Active Record
gem "puma", "~> 3.0"        # Use Puma as the app server

#################################################
# Assets
#################################################

# Stylesheets
gem "bourbon"                         # A lightweight SASS toolset
gem "neat"                            # Grid and media queries
gem "sass-rails", "~> 5.0"            # Use SCSS for stylesheets

# Javascript
gem "uglifier", ">= 1.3.0"            # Use Uglifier as compressor for JavaScript assets
gem "coffee-rails", "~> 4.2"          # Use CoffeeScript for .coffee assets and views
gem "jquery-rails"                    # Use jquery as the JavaScript library
gem "font-awesome-sass", "~> 4.7.0"   # Font-Awesome Sass gem for use in Ruby/Rails projects
gem "therubyracer",                   # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  platforms: :ruby

#################################################
# Environments
#################################################

group :development do
  gem "byebug"              # Call "byebug" anywhere to stop and enter debugging console
  gem "capistrano"          # Remote multi-server automation tool
  gem "capistrano-rails"    # Rails integration for Capistrano 3.x
  gem "capistrano-rbenv"    # Rbenv integration for Capistrano 3.x
  gem "capistrano-nginx"    # Nginx tasks for Capistrano
  gem "capistrano3-puma"    # Puma taks for Capistrano
end
