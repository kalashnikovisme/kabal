require 'test_helper'

class RomanTest < TestCase
  def setup
    @lang = Kabal::Roman.new
  end

  def test_zero_number
    assert_equal "0", @lang.convert(0)
    assert_equal "0", @lang.convert(-0)
  end
  def test_to_text_with_single_number
    assert_equal "I", @lang.convert(1)
  end
  def test_to_text_with_two_words_number
    assert_equal "XXV", @lang.convert(25)
  end
  def test_to_text_with_three_words_number
    assert_equal "DCXXV", @lang.convert(625)
  end
end
