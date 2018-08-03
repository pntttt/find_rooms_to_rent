source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "3.1.12"
gem "bootstrap-sass", "~> 3.3.6"
gem 'cloudinary'
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker"
gem "font-awesome-rails"
gem "geocoder", "~> 1.4"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-ui-rails"
gem 'mysql2', '~> 0.3.18'
gem "paperclip", "~> 5.1.0"
gem 'paperclip-cloudinary'
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "toastr-rails", "~> 1.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
