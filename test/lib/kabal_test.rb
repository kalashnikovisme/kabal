require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_language_init
    Kabal.language = "Russian"
    assert_equal "Russian", Kabal.current_language
  end

  def test_to_text
    Kabal.language = "Russian"
    assert_equal "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять", Kabal.to_text(125125125125)
    assert_equal "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять", Kabal.to_text("125125125125")
  end

  def test_to_text_in_language
    assert_equal "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять", Kabal.to_text_in_language(125125125125, "Russian")
    assert_equal "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять", Kabal.to_text_in_language("125125125125", "Russian")
  end

  def test_to_text_in_language_by_index
    assert_equal  "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять", Kabal.to_text_in_language_by_index(125125125125, 0)
    assert_equal  "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять", Kabal.to_text_in_language_by_index("125125125125", 0)
  end

  def test_to_text_in_language_by_index_with_unsupport_language
    assert_equal NoLanguageSupportError.message, Kabal.to_text_in_language_by_index(125125125125, 3)
    assert_equal NoLanguageSupportError.message, Kabal.to_text_in_language_by_index("125125125125", 3)
  end

  def test_to_text_in_language_with_unsupported_language
    assert_equal NoLanguageSupportError.message, Kabal.to_text_in_language(125125125125, "Elfin")
    assert_equal NoLanguageSupportError.message, Kabal.to_text_in_language("125125125125", "Elfin")
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
    assert_equal 10 ** 102, Kabal.maximum_for("Russian")
    assert_equal (10 ** 66) - 1, Kabal.maximum_for("English")
    assert_equal (10 ** 24) - 1, Kabal.maximum_for("Deutsch")
  end

  def test_minimum_for_language
    assert_equal -(10 ** 102), Kabal.minimum_for("Russian")
    assert_equal -(10 ** 66) + 1, Kabal.minimum_for("English")
    assert_equal -(10 ** 24) + 1, Kabal.minimum_for("Deutsch")
  end

  def test_minimum_and_maximum_convert_for_language
    Kabal.supported_languages.each do |language|
      Kabal.to_text_in_language Kabal.maximum_for(language), language
      Kabal.to_text_in_language Kabal.minimum_for(language), language
    end
  end

  def test_language_supports_negative
    assert Kabal.language_supports_negative? "Russian"
  end

  def test_language_supports_fractional
    assert Kabal.language_supports_fractional? "English"
  end

  def test_big_number
    assert_equal NumberOutRangeError.message, Kabal.to_text_in_language(10000000000000000000000000000000000000, "Deutsch")
  end

  def test_bad_number_test
    Kabal.language = "Russian"
    assert_equal "сто десять квинтиллионов одна тысяча одиннадцать", Kabal.to_text("110000000000000001011")
    assert_equal "одиннадцать квадраллионов одиннадцать", Kabal.to_text("11000000000000011")
    assert_equal "сто двенадцать квинтиллиона двести двадцать три квадраллиона триста тридцать четыре триллиона четыреста сорок пять миллиардов пятьсот пятьдесят шесть миллионов шестьсот шестьдесят одна тысяча одиннадцать", Kabal.to_text("112223334445556661011")
    assert_equal "девятьсот девять миллионов девяносто тысяч девятьсот девять целых одна тысяча двести тридцать четыре десятитысячных", Kabal.to_text("909090909.1234")
    assert_equal "девятьсот девять миллионов девяносто тысяч девятьсот девять целых одна тысяча двести тридцать четыре десятитысячных", Kabal.to_text(909090909.1234)
  end

  def test_defined_methods
    assert Kabal.to_text_in_russian 1
    assert Kabal.to_text_in_english 1
    assert Kabal.to_text_in_deutsch 1
  end
end
