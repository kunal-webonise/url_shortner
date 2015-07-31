# config valid only for current version of Capistrano


set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
set :application, "myapp"
set :repository, 'git@github.com:kunal-webonise/url_shortner.git'
set :scm, :git
set :use_sudo, false
set :deploy_to, "/home/ubuntu/www/url_shortner"

task :do_bundle_install do

  run  'cd /home/ubuntu/www/url_shortner/current && bundle update'
  run 'rake db:create --trace'
  run 'rake db:migrate --trace'
  run 'echo restarting apache'
  run 'sudo /etc/init.d/apache2 restart'
end

after 'deploy', 'do_bundle_install'
