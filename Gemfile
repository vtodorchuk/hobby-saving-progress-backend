source 'https://rubygems.org'

ruby '3.3.1'

gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

gem 'bcrypt', '~> 3.1.7'
gem 'redis', '>= 4.0.1'

gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'draper', '~> 4.0', '>= 4.0.2'
gem 'jsonapi-serializer', '~> 2.2'
gem 'trailblazer-option', '~> 0.1.2'

gem 'jwt_sessions', '~> 3.2', '>= 3.2.2'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]

  gem 'brakeman', '~> 6.1', '>= 6.1.2'
  gem 'bundler-audit', '~> 0.9.1'
  gem 'rubocop', '~> 1.63', '>= 1.63.5'
  gem 'rubocop-performance', '~> 1.21'
  gem 'rubocop-rails', '~> 2.24', '>= 2.24.1'
  gem 'rubocop-rspec', '~> 2.29', '>= 2.29.2'
end

group :development do
  gem 'spring'
end
