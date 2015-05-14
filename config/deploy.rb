# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Recipe_Saver'
set :repo_url, 'git@github.com:timheise300/RecipeSaver.git'
set :rbenv_ruby, '2.2.2'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www'

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
       execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

end
