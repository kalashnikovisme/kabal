require 'test_helper'

class RussianTest < TestCase
  def setup
    @rus = Kabal::Russian.new
  end

  def test_to_text_with_single_number
    assert_equal @rus.convert(1), "один"
    assert_equal @rus.convert(-1), "минус один"
  end
  def test_to_text_with_two_words_number
    assert_equal @rus.convert(25), "двадцать пять"
    assert_equal @rus.convert(-25), "минус двадцать пять"
  end
  def test_to_text_with_three_words_number
    assert_equal @rus.convert(625), "шестьсот двадцать пять"
    assert_equal @rus.convert(-625), "минус шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers
    assert_equal @rus.convert(125625), "сто двадцать пять тысяч шестьсот двадцать пять"
    assert_equal @rus.convert(-125625), "минус сто двадцать пять тысяч шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers_millions
    assert_equal @rus.convert(125125625), "сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять"
    assert_equal @rus.convert(-125125625), "минус сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers_some_number
    assert_equal @rus.convert(1000001), "один миллион один"
    assert_equal @rus.convert(-1000001), "минус один миллион один"
  end
  def test_to_text_with_google
    assert_equal @rus.convert(10 ** 100), "гугол"
    assert_equal @rus.convert(-(10 ** 100)), "минус гугол"
  end
  def test_to_text_with_three_words_without_second_order
    assert_equal @rus.convert(101), "сто один"
    assert_equal @rus.convert(-101), "минус сто один"
  end
  def test_to_text_with_three_words_without_first_and_second_order
    assert_equal @rus.convert(200), "двести"
    assert_equal @rus.convert(-200), "минус двести"
  end
  def test_to_text_with_thousands
    assert_equal @rus.convert(22000), "двадцать две тысячи"
    assert_equal @rus.convert(-22000), "минус двадцать две тысячи"
  end
  def test_to_text_with_negative_number
    exception = assert_raises RuntimeError do
      @rus.convert -(10 ** 103)
    end
    assert_equal NumberOutRangeError.message, exception.message
  end
  def test_to_text_with_fractional_number
    assert_equal @rus.convert(1.05), "одна целая пять сотых"
  end
  def test_to_text_with_fractional_number
    assert_equal @rus.convert(1.0), "один"
  end
end
