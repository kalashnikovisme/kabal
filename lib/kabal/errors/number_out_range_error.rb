class Kabal::Errors::NumberOutRangeError < StandardError
  def self.message
    "Number is out of the range for current language"
  end
end
