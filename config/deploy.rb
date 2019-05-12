# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "power-life"
set :repo_url, "https://github.com/deguzman20/power-life-ecommerce.git"

set :use_sudo, false
set :stage, :development
set :deploy_to, "/home/powerlife/public_html/power-life"

namespace :deploy do

  desc "Change HTML Symlink to relative path"
  task :create_symlink do
    on roles(:app) do

        #execute "ls -l"
        info "Modifying symlink to be relative"
        execute "rm -d #{current_path}"

        info "Deleted current symlink"
        execute "cd /home/powerlife/public_html/power-life && ln -s /home/powerlife/public_html/power-life/releases/#{File.basename release_path} current"
        info "Created relative current symlink"
    end
  end

end


append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"


after :deploy, "deploy:create_symlink"
