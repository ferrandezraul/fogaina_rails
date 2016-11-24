source 'https://rubygems.org'

ruby "2.2.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'refinerycms-testing', '~> 3.0.0'
  gem "awesome_print"
  gem "better_errors"
  gem "launchy"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


# Refinery CMS
gem 'refinerycms', '~> 3.0'

# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', ['~> 2.0', '>= 2.0.1']
gem 'refinerycms-wymeditor', ['~> 1.0', '>= 1.0.6']
gem 'refinerycms-authentication-devise', '~> 1.0'
#  gem 'refinerycms-blog', ['~> 3.0', '>= 3.0.0']         # Me: I tried this one, but refinerycms-news might be more suitable
#  gem 'refinerycms-inquiries', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-search', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-page-images', ['~> 3.0', '>= 3.0.0']  # Me:This extension is not properly maintaned
gem 'refinerycms-image_slideshows', github: 'bisscomm/refinerycms-image-slideshows', branch: '3-0-stable'

gem 'refinerycms-news', git: 'https://github.com/refinery/refinerycms-news', branch: 'master'
# Todo: Add https://github.com/refinery/refinerycms-portfolio combined with some js gallery.

gem 'foundation-rails', '~> 5.5.3.2'
gem 'foundation-icons-sass-rails' 

# Needed due to issues with foundation 5 and turbolinks
# See http://foundation.zurb.com/forum/posts/2348-foundation-5-topbar-menu-not-responding-on-rails4
gem 'jquery-turbolinks'

gem 'refinerycms-breads', path: 'vendor/extensions'
gem 'refinerycms-cafeteria_categories', path: 'vendor/extensions'
gem 'refinerycms-videos', path: 'vendor/extensions'

group :production do
  # Heroku dependency needed in rails4
  gem 'rails_12factor'
  # Refinery doc
  # If you want to use Refinery’s image and resource support, you need to add the ‘fog’ gem too.
  gem 'fog'
  gem "dragonfly-s3_data_store"
end

# Added for AWS S3 support
# See https://devcenter.heroku.com/articles/paperclip-s3
gem 'paperclip'
gem 'aws-sdk', '~> 2.3'

gem 'sitemap_generator', '~> 5.1'

gem 'meta-tags'
