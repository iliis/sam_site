set :application, "sam"

set :repository,  "git@github.com:iliis/sam_site.git"
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/samuel/sam"
default_run_options[:pty] = true

role :web, "klamath.ch"                          # Your HTTP server, Apache/etc
role :app, "klamath.ch"                          # This may be the same as your `Web` server
role :db,  "klamath.ch", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

after 'deploy:update_code', 'deploy:symlink_private'
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "symlinks sensitive config files"
  task :symlink_private, :roles => :app do
    run "ln -fs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    run "ln -fs #{deploy_to}/shared/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  end
end
