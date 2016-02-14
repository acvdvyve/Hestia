set :application, 'hestia'
set :repo_url, 'git@github.ugent.be:vgk/hestia.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

 set :deploy_to, '/var/www/hestia'
 set :scm, :git
 set :branch, "master"
 set :deploy_user, "hestia"
 set :use_sudo, false
 set :rails_env, "production"
# setup rvm

set :rvm_type, :auto
set :rvm_ruby_version, "2.2.1@#{fetch(:application)}"
set :rvm_bin_path, '/home/hestia/.rvm/gems/ruby-2.2.1/bin'
set :rvm_gemset_path, '/home/hestia/.rvm/gems/ruby-2.2.1'
set :bundle_path, nil
set :bundle_binstubs, nil
set :bundle_flags, '--system'

# authorisation method
 set :ssh_options, { :forward_agent => true }

 set :log_level, :info
# passenger-capistrano gem configuration. see https://github.com/capistrano/passenger/ for more info.
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
 set :pty, true

 set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', '/share/fotos/public_html')
 set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
 set :keep_releases, 20

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

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
