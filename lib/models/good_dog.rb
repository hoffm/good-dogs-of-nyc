class GoodDog < ActiveRecord::Base
  def neighborhood
    Neighborhoods.from_zip(zip_code)
  end

  def color_phrase
    Colors.to_phrase(color_1, color_2, color_3)
  end
end
