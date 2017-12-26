require "dotenv/load"
require "active_record"
require "active_support/all"
require "pg"
require "logger"

ENV["APP_ENV"] ||= "development"

ActiveRecord::Base.logger = Logger.new("debug.log")
configuration = YAML::safe_load(ERB.new(IO.read("db/config.yml")).result)
ActiveRecord::Base.establish_connection(configuration[ENV["APP_ENV"]])

GOOD_DOGS_APP_PATH = Dir.pwd + "/lib/good_dogs"
module Text; end
Text.autoload(:PostProcessor, "#{GOOD_DOGS_APP_PATH}/text/post_processor.rb")
Dir[GOOD_DOGS_APP_PATH + "/**/*.rb"].each { |f| require f }
