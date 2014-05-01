class NumberOutRangeError < StandardError
  def message
    "Number is out of the range for current language"
  end
end
