# config valid for current version and patch releases of Capistrano
lock "~> 3.11"






set :application, "robo"
set :deploy_user, 'deploy'
set :repo_url, "git@github.com:zdania/robo.git"

set :deploy_to, "/home/deploy/apps/production/#{fetch(:application)}"

set :rbenv_type, :user
set :rbenv_ruby, '2.4.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

append :linked_files, "config/database.yml", "config/application.yml"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/uploads", "vendor/bundle"

after 'deploy:publishing', 'deploy:restart'
set :passenger_restart_with_touch, true
