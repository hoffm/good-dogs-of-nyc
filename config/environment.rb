require "active_record"
require "pg"
require "logger"

ActiveRecord::Base.logger = Logger.new("debug.log")
configuration = YAML::safe_load(IO.read("db/config.yml"))
ActiveRecord::Base.establish_connection(configuration["development"])

Dir[Dir.pwd + "/lib/models/**/*.rb"].each { |f| require f }
