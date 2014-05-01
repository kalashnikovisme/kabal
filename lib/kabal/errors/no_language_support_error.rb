class Kabal::Errors::NoLanguageSupportError < StandardError
  def self.message
    "There is no support of such language yet"
  end
end
