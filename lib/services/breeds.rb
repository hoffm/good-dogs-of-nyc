module Breeds
  module_function

  def clean(raw_breed)
    replace_mix(unreverse(raw_breed.titlecase))
  end

  # Private helpers

  def replace_mix(str)
    str.sub(" X", " Mix")
  end
  private_class_method :replace_mix

  def unreverse(str)
    str.split(", ").reverse.join(" ")
  end
  private_class_method :unreverse
end
