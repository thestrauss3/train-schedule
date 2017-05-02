source 'https://rubygems.org/'
ruby '2.3.3'

gem 'pg', '~> 0.15'
gem 'rails', '5.0.0.1'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'listen'
group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'

  gem 'shoulda'
  gem 'valid_attribute'
end

group :test do
  gem 'coveralls', require: false
  gem 'launchy', require: false
end

group :production do
  gem 'rails_12factor'
end
