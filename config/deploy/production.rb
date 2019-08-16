set :stage, :production
set :branch, "master"

server '77.55.234.159', user: 'deploy', roles: %w{web app db}, primary: true

set :deploy_to, "/home/deploy/apps/#{fetch(:stage)}/#{fetch(:application)}"
set :rails_env, :production
