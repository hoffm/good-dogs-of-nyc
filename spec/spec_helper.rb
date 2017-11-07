require "./lib/good_dogs"
ENV["RACK_ENV"] = "test"
Dir[Dir.pwd + "/spec/support/**/*.rb"].each { |f| require f }
