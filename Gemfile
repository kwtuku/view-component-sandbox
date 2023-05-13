source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console"

  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rufo", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

  gem "simplecov", require: false
end
