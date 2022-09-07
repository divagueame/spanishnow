# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "mambo"
set :repo_url, "git@github.com:divagueame/spanishnow.git"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "main"
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'


# set :default_environment, { 
#   'PATH' => "/path/to/.rvm/ree-1.8.7-2009.10/bin:/path/to/.rvm/gems/ree/1.8.7/bin:/path/to/.rvm/bin:$PATH",
#   'RUBY_VERSION' => 'ruby 3.1.2',
#   'GEM_HOME' => '/path/to/.rvm/gems/ree/1.8.7',
#   'GEM_PATH' => '/path/to/.rvm/gems/ree/1.8.7' 
# }
set :bundle_gemfile, "mambo/Gemfile"
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
