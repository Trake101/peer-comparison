set :rails_env, "staging"

role :web, "oir-web-dev.oit.umn.edu"                          # Your HTTP server, Apache/etc
role :app, "oir-web-dev.oit.umn.edu"                          # This may be the same as your `Web` server
role :db,  "oir-web-dev.oit.umn.edu", :primary => true 	   # This is where Rails migrations will run

