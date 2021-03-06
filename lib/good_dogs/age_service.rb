class AgeService
  attr_accessor :year, :month

  REF_DATE = Time.new(2016, 4, 28)
  YEAR_REPORT_MIN = 2

  def initialize(year, month)
    @year = year
    @month = month || 1
    validate!
  end

  def adjectival_age_phrase
    "#{age_phrase_parts.join('-').singularize}-old"
  end

  def predicate_age_phrase
    "#{age_phrase_parts.join(' ')} old"
  end

  private

  def age_months
    year_delta * 12 + month_delta
  end

  def age_phrase_parts
    report_in_years? ? [age_years, "years"] : [age_months, "months"]
  end

  def age_years
    year_delta - (month_delta.positive? ? 0 : 1)
  end

  def negative_age?
    age_months.negative?
  end

  def month_delta
    REF_DATE.month - month
  end

  def report_in_years?
    age_years >= YEAR_REPORT_MIN
  end

  def validate!
    raise NegativeAgeError if negative_age?
  end

  def year_delta
    REF_DATE.year - year
  end

  class NegativeAgeError < StandardError
  end
end
