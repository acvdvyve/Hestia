set :application, 'hestia'
set :repo_url, 'git@github.ugent.be:vgk/hestia.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

 set :deploy_to, '/var/www/hestia'
 set :scm, :git
 set :branch, "master"
 set :user, "hestia"
 set :use_sudo, false
 set :rails_env, "production"
 # set :deploy_via, :copy
 set :rbenv_ruby, '2.1.2'
 set :ssh_options, { :forward_agent => true }
set :passenger_roles, :app
set :passenger_restart_runner, :sequence
set :passenger_restart_wait, 5
set :passenger_restart_limit, 2
set :passenger_restart_with_sudo, true
set :passenger_restart_with_touch, true
set :passenger_environment_variables, {}
set :passenger_restart_command, 'passenger-config restart-app'
set :passenger_restart_options, -> { "#{deploy_to} --ignore-app-not-running" }
# default_run_options[:pty] = true
server "vgkserv.ugent.be", :roles => [:app, :web, :db], :primary => true


# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
 set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      #	execute :mkdir,'-p', "#{ File.join(current_path) }"	
      #	execute :touch,  " #{ File.join(current_path, 'tmp', 'restart.txt') }"   
    end
  end

#  desc "Restart Passenger app"
#  task :restart do
#    execute :try_sudo, " touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
#  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
#  after "deploy", "deploy:symlink_config_files"
  after "deploy", "deploy:restart"

end

desc "Symlink shared config files"
task :symlink_config_files do
  on roles (:all) do	
	execute "ln -s #{ deploy_to }/shared/config/database.yml ##{ current_paht }/config/database.yml"
  end
end

#desc "Restart Passenger app"
#task :restart do
#	run "#{ try_sudo } touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
#end
