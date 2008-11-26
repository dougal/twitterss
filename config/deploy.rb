set :application, "twitterss"

set :scm, :git
set :repository,  "git@github.com:dougal/twitterss.git"
set :branch, "master"
#set :deploy_via, :remote_cache

ssh_options[:port] = 9123

after :deploy, "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, '/var/www/twitterss'

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :runner, 'dougal'

role :app, "badger"
role :web, "badger"
role :db,  "badger", :primary => true

namespace :deploy do
  task :restart do
    run "cd /var/www/dvsb/current; touch tmp/restart.txt"
  end
  task :migrate do
    # nothing, yah!
  end
end