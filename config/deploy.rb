
# set :bundle_gemfile, "mambo/Gemfile" 

set :application, "mambo"
set :repo_url, "git@github.com:divagueame/spanishnow.git" 
set :branch, "main"
# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
# set :linked_files, %w{config/master.key}
set :linked_files, %w{config/production.key}
# Only keep the last 5 releases to save disk space
set :keep_releases, 5

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# namespace :config do
#    task :symlink do
#       on roles(:app) do
#         execute :ln, "-s #{shared_path}/master.key #{release_path}/config/master.key"
#       end
#    end
# end

# after 'deploy:symlink:shared', 'config:symlink'
