require "date"

class GoodDogJsonConverter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    {
      name: clean_string("Dog Name").titlecase,
      breed: BreedCleaner.new(breed).call,
      color_1: clean_string("Animal Dominant Color"),
      color_2: clean_string("Animal Secondary Color"),
      color_3: clean_string("Animal Third Color"),
      sex: clean_string("Animal Gender"),
      zip_code: clean_string("Owner Zip Code"),
      birth_month: birth_month,
      birth_year: birth_year,
      guard_or_trained: translate_boolean("Guard or Trained"),
      vaccinated: translate_boolean("Vaccinated"),
      spayed_or_neutered: translate_boolean("Spayed or Neut"),
    }
  end

  private

  def birth_month
    Date::ABBR_MONTHNAMES.index(split_birth_date.first)
  end

  def birth_year
    short_year = split_birth_date.last.to_i
    short_year < 20 ? short_year + 2000 : short_year + 1900
  end

  def breed
    [data["Breed"], data["Breed Other"]].reject do |breed|
      breed.blank? || breed == "Unknown"
    end.first.to_s
  end

  def clean_string(key)
    data[key].strip
  end

  def split_birth_date
    data["Animal Birth"].split("-")
  end

  def translate_boolean(key)
    case data[key]
    when "Yes" then true
    when "No" then false
    end
  end

  class BreedCleaner
    attr_accessor :breed

    def initialize(breed)
      @breed = breed
    end

    def call
      replace_mix(unreverse(strip(breed.titlecase)))
    end

    private

    def strip(str)
      str.strip.squeeze(" ")
    end

    def replace_mix(str)
      str.sub(" X", " Mix")
    end

    def unreverse(str)
      str.split(", ").reverse.join(" ")
    end
  end
end
