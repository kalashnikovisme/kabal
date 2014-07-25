require "test_helper"

include Kabal

class BigTest < TestCase
  def test_all_numbers_for_all_languages
    Kabal.supported_languages.each do |lang|
      Kabal.language = lang
      (-(10 ** 4)..10 ** 4).each do |number|
        assert Kabal.to_text(number), [lang, number].to_s
      end
    end
  end

  def test_all_fractional_numbers_in_all_languages
    Kabal.supported_languages.each do |lang|
      Kabal.language = lang
      if Kabal.current_language_supports_fractional?
        i = 0
        while i < 10 do
          assert Kabal.to_text(i), [lang, i].to_s
          i = (i + 0.001).round 3
        end
      end
    end
  end
end
