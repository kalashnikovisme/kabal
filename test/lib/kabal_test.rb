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
  #def test_to_text_with_ten_powers_some_number
  #  assert_equal Kabal.to_text(1000000), "сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять"
  #end
end
