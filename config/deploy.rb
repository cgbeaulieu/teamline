require 'bundler/capistrano'
require 'whenever/capistrano'

set :application, "teamline-app"
set :repository,  "git@github.com:flatiron-school/teamline.git"

set :user, 'teamline'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true

role :web, "96.8.123.76"
role :app, "96.8.123.76"

role :db,  "96.8.123.76", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
before "deploy:assets:precompile", "deploy:symlink_configs"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_configs, :roles => :app do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config" 
    run "ln -nfs #{shared_path}/api_keys.yml #{release_path}/config" 
  end
end
