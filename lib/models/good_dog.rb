class GoodDog < ActiveRecord::Base
  def color
    ColorService.to_phrase(color_1, color_2, color_3)
  end

  def neighborhood
    NeighborhoodService.from_zip(zip_code)
  end
end
