rails_env = ENV['RAILS_ENV'] || "development"
  
# 16 workers and 1 master
worker_processes (rails_env == 'production' ? 16 : 1)

preload_app true
timeout 30

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end