require "test_helper"

include Kabal

class BigTest < TestCase
  def test_all_numbers_for_all_languages
    Kabal.supported_languages.each do |lang|
      Kabal.language = lang
      (0..10 ** 4).each do |number|
        assert Kabal.to_text number
      end
    end
  end
end
