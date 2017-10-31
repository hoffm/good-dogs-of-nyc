require "date"

class GoodDogJsonConverter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    {
      name: clean_string("Dog Name"),
      breed_1: clean_string("Breed"),
      breed_2: clean_string("Breed Other"),
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

  def clean_string(key)
    data[key].strip.titlecase
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
end
