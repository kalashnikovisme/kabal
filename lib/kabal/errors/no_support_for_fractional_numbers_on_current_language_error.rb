class Kabal::Errors::NoSupportForFractionalNumberOnCurrentLanguages < StandardError
  def self.message
    "Current language doesn't support fractional numbers"
  end
end
