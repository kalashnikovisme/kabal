require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_language_init
    Kabal.language = "Russian"
    assert_equal Kabal.current_language, "Russian"
  end

  def test_to_text
    assert_equal Kabal.to_text(125125125125), "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять"
  end

  def test_to_text_in_language
    assert_equal Kabal.to_text_in_language(125125125125, "Russian"), "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять"
  end

  def test_to_text_in_language_by_index
    assert_equal Kabal.to_text_in_language_by_index(125125125125, 0), "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять"
  end

  def test_to_text_in_language_with_unsupported_language
    assert_equal NoLanguageSupportError.message, Kabal.to_text_in_language(125125125125, "Elfin")
  end

  def test_language_init_with_unsupported_language
    exception = assert_raises RuntimeError do
      Kabal.language = "Elfin"
    end
    assert_equal NoLanguageSupportError.message, exception.message
  end

  def test_supported_languages
    assert Kabal.supported_languages
  end

  def test_current_language
    assert Kabal.current_language
  end

  def test_current_language_support_natural?
    assert Kabal.current_language_supports_natural?
  end

  def test_current_language_support_fractional?
    assert Kabal.current_language_supports_fractional?
  end

  def test_maximum_for_language
    assert Kabal.maximum_for("Russian"), 10 ** 102
    assert Kabal.maximum_for("English"), (10 ** 66) - 1
  end

  def test_minimum_for_language
    assert Kabal.maximum_for("Russian"), -(10 ** 102)
    assert Kabal.maximum_for("English"), 0
  end
end
