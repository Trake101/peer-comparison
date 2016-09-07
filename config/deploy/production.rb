set :rails_env, "production"
set :user, "swadm"

role :web, "oir-web-prd.oit.umn.edu"                          # Your HTTP server, Apache/etc
role :app, "oir-web-prd.oit.umn.edu"                          # This may be the same as your `Web` server
role :db,  "oir-web-prd.oit.umn.edu", :primary => true      # This is where Rails migrations will run
