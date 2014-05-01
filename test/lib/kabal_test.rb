require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_to_text_with_single_number
    assert_equal Kabal.to_text(1), "один"
  end
  def test_to_text_with_two_words_number
    assert_equal Kabal.to_text(25), "двадцать пять"
  end
  def test_to_text_with_three_words_number
    assert_equal Kabal.to_text(625), "шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers
    assert_equal Kabal.to_text(125625), "сто двадцать пять тысяч шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers_millions
    assert_equal Kabal.to_text(125125625), "сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers_some_number
    assert_equal Kabal.to_text(1000001), "один миллион один"
  end
  def test_to_text_with_google
    assert_equal Kabal.to_text(10 ** 100), "гугол"
  end
  def test_to_text_with_three_words_without_second_order
    assert_equal Kabal.to_text(101), "сто один"
  end
  def test_to_text_with_three_words_without_first_and_second_order
    assert_equal Kabal.to_text(200), "двести"
  end
  def test_to_text_with_thousands
    assert_equal Kabal.to_text(22000), "двадцать две тысячи"
  end
  def test_language_init
    Kabal.language = "Russian"
    assert_equal Kabal.current_language, "Russian"
  end
end
