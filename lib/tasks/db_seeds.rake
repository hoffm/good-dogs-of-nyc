namespace :db_seeds do
  GOOD_DOGS_JSON_FILE_PATH = "./data/good_dogs.json".freeze

  desc "Seed database with good dog data from json"
  task seed_good_dogs_data: :get_good_dogs_json do
    require_relative "good_dog_json_converter"
    dog_list = JSON.parse(File.read(GOOD_DOGS_JSON_FILE_PATH))

    dog_list.each_with_index do |good_dog_data, i|
      good_dog_attrs = GoodDogJsonConverter.new(good_dog_data).call
      GoodDog.create!(good_dog_attrs)
      print "." if (i % 100).zero?
    end
  end

  desc "Download dog data json from Github"
  task :get_good_dogs_json do
    require "net/http"
    unless File.exists?(GOOD_DOGS_JSON_FILE_PATH)
      url = "https://raw.githubusercontent.com/hoffm/datasets/master/dogs/nycdogs.json"
      File.open(GOOD_DOGS_JSON_FILE_PATH, "w") do |f|
        f.write Net::HTTP.get(URI.parse(url))
      end
    end
  end
end
