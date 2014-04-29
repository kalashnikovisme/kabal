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
end
