set :application, "credulus"
set :repository,  "git@github.com:reblevins/credulus.git"
default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :scm, "git"
set :user, "blevins"  # The server's user for deploys
set :scm_passphrase, "ZNMUuysL"  # The deploy user's password
set :deploy_via, :remote_cache
set :scm_verbose, true

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/blevins/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "credul.us"
role :web, "credul.us"
role :db,  "credul.us", :primary => true

set :use_sudo, false
set :chmod755, "app config db lib public vendor script script/* public/disp*"

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "Sart Application -- not needed for Passenger"
  task :start, :roles => :app do
    # nothing -- need to override default cap start task when using Passenger
  end
end