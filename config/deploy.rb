# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, 'ruby-1.9.2-p320'
set :rvm_type, :user
set :bundle_flags, "--deployment"

set :default_environment, {
    'PATH' => ENV['PATH'],
    'RAILS_ENV' => ENV['RAILS_ENV']
}

#set :stages, %w(staging production)
#require 'capistrano/ext/multistage'

set :application, "testapp"
set :repository,  "https://github.com/mschinca/testapp.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :applicationdir, '/var/www/testapp'
default_run_options[:pty] = true

role :web, "testapp.com"                          # Your HTTP server, Apache/etc
role :app, "testapp.com"                          # This may be the same as your `Web` server
role :db,  "testapp.com", :primary => true # This is where Rails migrations will run
role :db,  "testapp.com"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# don't use sudo
set :use_sudo, false

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
