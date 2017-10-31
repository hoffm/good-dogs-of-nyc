namespace :irb do
  desc "Open interactive REPL with our application preloaded"
  task :console do
    system("irb -r ./config/environment.rb")
  end
end
