require 'test_helper'

class RussianTest < TestCase
  def setup
    @rus = Kabal::Russian.new
  end

  def test_to_text_with_single_number
    assert_equal @rus.convert(1), "один"
  end
  def test_to_text_with_two_words_number
    assert_equal @rus.convert(25), "двадцать пять"
  end
  def test_to_text_with_three_words_number
    assert_equal @rus.convert(625), "шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers
    assert_equal @rus.convert(125625), "сто двадцать пять тысяч шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers_millions
    assert_equal @rus.convert(125125625), "сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять"
  end
  def test_to_text_with_ten_powers_some_number
    assert_equal @rus.convert(1000001), "один миллион один"
  end
  def test_to_text_with_google
    assert_equal @rus.convert(10 ** 100), "гугол"
  end
  def test_to_text_with_three_words_without_second_order
    assert_equal @rus.convert(101), "сто один"
  end
  def test_to_text_with_three_words_without_first_and_second_order
    assert_equal @rus.convert(200), "двести"
  end
  def test_to_text_with_thousands
    assert_equal @rus.convert(22000), "двадцать две тысячи"
  end
end
