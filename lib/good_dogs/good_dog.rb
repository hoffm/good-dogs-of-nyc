class GoodDog < ActiveRecord::Base
  def adjectival_age
    age_info.adjectival_age_phrase
  end

  def age
    age_info.predicate_age_phrase
  end

  def breed
    self[:breed].empty? ? "mut" : self[:breed]
  end

  def color
    ColorService.to_phrase(color_1, color_2, color_3)
  end

  def mark_as_tweeted!
    update_attributes!(tweeted: true)
  end

  def neighborhood
    NeighborhoodService.from_zip(zip_code)
  end

  private

  def age_info
    AgeService.new(birth_year, birth_month)
  end
end
