require "dotenv/load"
require "active_record"
require "pg"
require "logger"

ENV["RACK_ENV"] ||= "development"

ActiveRecord::Base.logger = Logger.new("debug.log")
configuration = YAML::safe_load(IO.read("db/config.yml"))
ActiveRecord::Base.establish_connection(configuration[ENV["RACK_ENV"]])

APP_PATH = Dir.pwd + "/lib/good_dogs"
module Text; end
Text.autoload(:PostProcessor, "#{APP_PATH}/text/post_processor.rb")
Dir[APP_PATH + "/**/*.rb"].each { |f| require f }
