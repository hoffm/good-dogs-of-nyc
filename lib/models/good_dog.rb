class GoodDog < ActiveRecord::Base
  def neighborhood
    Neighborhoods.from_zip(zip_code)
  end
end
