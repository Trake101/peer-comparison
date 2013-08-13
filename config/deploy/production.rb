set :rails_env, "production"

role :web, "oir-web1.oit.umn.edu"                          # Your HTTP server, Apache/etc
role :app, "oir-web1.oit.umn.edu"                          # This may be the same as your `Web` server
role :db,  "oir-web1.oit.umn.edu", :primary => true 	   # This is where Rails migrations will run
