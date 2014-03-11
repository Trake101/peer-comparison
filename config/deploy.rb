set :stages, %w(staging production)
set :default_stage, "staging"
set :rvm_ruby_string, '1.9.3@oir-web'

require 'capistrano/ext/multistage'
require "bundler/capistrano"
#require "rvm/capistrano"

set :application, "peer-comparison"
set :user, "deploy"
set :deploy_to, "/swadm/www/peer-comparison"

set :scm, :git
set :deploy_via, :remote_cache
set :repository,  "git@github.umn.edu-peer-comparison:oir/peer-comparison.git"
set :branch, "master"
set :ssh_options, { :forward_agent => true }

set :use_sudo, false

default_environment['RAILS_RELATIVE_URL_ROOT'] = '/peer-comparison'

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   
  desc "Copy database.yml file to the project directory"
  task :copy_database_yml, :roles => :app do
    run "cp -pf #{shared_path}/db/database.yml #{release_path}/config"
  end
 end
 before 'deploy:assets:precompile', 'deploy:copy_database_yml'
 
 namespace :utils do
   desc "Allows you to tail your log for the passed stage"
   task :tail_log, :roles => :app do
    run "tail -f #{shared_path}/log/#{rails_env}.log"
   end
 end
 
