set :application, "testapp"
set :repository,  "/home/skin/projects/futur3/testapp"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :applicationdir, '/var/www/testapp'

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

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end