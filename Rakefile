require "./lib/good_dogs"
require "standalone_migrations"

StandaloneMigrations::Tasks.load_tasks

task default: :migrate

desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate("db/migrate")
end
