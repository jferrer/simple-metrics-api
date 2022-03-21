# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "bootsnap", ">= 1.4.4", require: false
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.5"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "listen", "~> 3.3"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "spring"
end

group :test do
  gem "fabrication"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
