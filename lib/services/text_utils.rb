module TextUtils
  NO_SPACE_BEFORE = %w(. , ! ?).freeze

  private

  def sentence_join(phrase_list)
    phrase_list.reduce("") do |accum_text, phrase|
      prefix = NO_SPACE_BEFORE.include?(phrase) ? "" : " "
      accum_text << (prefix + phrase)
    end.strip
  end
end
