source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "7.0.7"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "pg"
gem "propshaft"
gem "puma"
gem "redis"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "devise"
gem "primer_view_components"
gem "view_component"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem "factory_bot_rails"
  gem "parallel_tests"
  gem "rspec-rails"
end

group :development do
  gem "web-console"

  gem "annotate", require: false
  gem "bullet"
  gem "htmlbeautifier", require: false
  gem "letter_opener_web"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rufo", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver", "4.13.0" # https://github.com/SeleniumHQ/selenium/issues/12884

  gem "simplecov", require: false
end
