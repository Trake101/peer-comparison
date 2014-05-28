== Comparison Group Generator

The Comparison group generator is an application that puts a simple responsive web app on top of a comparison group data set Daniel Jones White created based on IPEDS data. It is a simple application from the developer perspective, the only complex piece is loading new data.

== Loading the institution data set
Assume you have installed ruby, rubygems, bundler and have this application up and running fresh, you can simply run:

`bundle exec rake import:institutions`

If you are loading a new data set, you will need to modify the rake task slightly. (lib/tasks/import.rake) It would be easiest to manipulate the data set to match the headers of the file "doc/peer_comparison_v3.xls". You will then need to truncate the institutions table and truncate the comparisons table. If you had the headers match the doc/peer_comparison_v3.xls file exactly, you can run the command below, or else you will need to make sure you tweak the Institution.create call starting on line 12.

`bundle exec rake import:institutions`
