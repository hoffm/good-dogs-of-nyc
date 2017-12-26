module ColorService
  module_function

  def to_phrase(*colors)
    colors.uniq.reject(&:blank?).to_sentence.downcase
  end
end
