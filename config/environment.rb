require "active_record"
require "pg"
require "logger"

ActiveRecord::Base.logger = Logger.new("debug.log")
configuration = YAML::safe_load(IO.read("db/config.yml"))
ActiveRecord::Base.establish_connection(configuration["development"])

%w(models services).each do |dir|
  Dir[Dir.pwd + "/lib/#{dir}/**/*.rb"].each { |f| require f }
end
