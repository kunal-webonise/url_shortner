# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'url_shortner'
#set :repo_url, 'git@github.com:kunal-webonise/url_shortner.git'
set :repo_url, 'https://github.com/kunal-webonise/url_shortner.git'

# Default branch is :master
set :branch, 'master'
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
#set :default_env, { path: "/home/webonise/.rvm/gems/ruby-1.9.3-p545/bin:/home/webonise/.rvm/gems/ruby-1.9.3-p545@global/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

 task :custom_recipe do on roles(:app) do
        within release_path do
                with rails_env: fetch(:rails_env) do
                        execute :bundle, "install --path #{shared_path}/bundle"
                        execute :chown, "-R kunal:kunal #{release_path}"
                        execute :rake, "db:create"
                        execute :rake, "db:migrate"
#                        execute :service, "apache2 restart"
                end
        end
     end
   end

after "deploy:updated", "custom_recipe"

