source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotusrb',            git: 'git://github.com/lotus/lotus.git',        branch: 'master'
gem 'lotus-utils',        git: 'git://github.com/lotus/utils.git',        branch: '0.6.x'
gem 'lotus-validations',  git: 'git://github.com/lotus/validations.git',  branch: '0.4.x'
gem 'lotus-router',       git: 'git://github.com/lotus/router.git',       branch: '0.5.x'
gem 'lotus-controller',   git: 'git://github.com/lotus/controller.git',   branch: '0.5.x'
gem 'lotus-view',         git: 'git://github.com/lotus/view.git',         branch: '0.5.x'
gem 'lotus-model',        git: 'git://github.com/lotus/model.git',        branch: '0.5.x'
gem 'lotus-helpers',      git: 'git://github.com/lotus/helpers.git',      branch: '0.2.x'
gem 'lotus-assets',       git: 'git://github.com/lotus/assets.git',       branch: '0.1.x'

gem 'pg'
gem 'puma'

gem 'bcrypt'

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end

gem 'wdm', '>= 0.1.0' if Gem.win_platform?
