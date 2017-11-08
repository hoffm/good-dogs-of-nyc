class GoodDog < ActiveRecord::Base
  def color_phrase
    Colors.to_phrase(color_1, color_2, color_3)
  end

  def neighborhood
    Neighborhoods.from_zip(zip_code)
  end

  def breed_phrase
    Breeds.clean(breed)
  end
end
