require "test_helper"

include Kabal

class BigTest < TestCase
  def test_all_natural_numbers_for_all_languages
    Kabal.supported_languages.each do |lang|
      Kabal.language = lang
      (0..10 ** 4).each do |number|
        assert Kabal.to_text number
      end
    end
  end

  def test_all_fractional_numbers_in_all_languages
    Kabal.supported_languages.each do |lang|
      i = 0
      while i < 10 do
        assert @rus.convert(i), i.to_s
        i = (i + 0.001).round 3
      end
    end
  end
end
