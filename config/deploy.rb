set :application, "IOMaero"
set :repository,  "git@maero.dk:iomaero.git"
set :deploy_to, "/var/www/io.maero.dk"

set :scm, :git
server "maero.dk", :web, :app, :db

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
