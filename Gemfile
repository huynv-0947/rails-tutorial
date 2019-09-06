source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}
gem "rubocop", "~> 0.54.0", require: false
ruby "2.5.1"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", "3.3.7"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.3"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "sqlite3"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "guard",                    "2.14.1"
  gem "guard-minitest",           "2.4.6"
  gem "minitest",                 "5.10.3"
  gem "minitest-reporters",       "1.1.14"
  gem "rails-controller-testing", "1.0.2"
  gem "selenium-webdriver"
end

group :production do
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
