class NoLanguageSupportError < StandardError
  def message
    "There is no support of such language yet"
  end
end
