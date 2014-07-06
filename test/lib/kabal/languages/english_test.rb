require 'test_helper'

class EnglishTest < TestCase
  def setup
    @eng = Kabal::English.new
  end

  def test_single_number
    assert_equal @eng.convert(1), "one"
  end

  def test_two_words
    assert_equal @eng.convert(21), "twenty one"
  end

  def test_three_words
    assert_equal @eng.convert(121), "one hundred twenty one"
  end

  def test_three_words_with_and
    assert_equal @eng.convert(102), "one hundred and two"
  end

  def test_thousands
    assert_equal @eng.convert(11121), "eleven thousand one hundred twenty one"
  end

  def test_thousands_with_and
    assert_equal @eng.convert(11021), "eleven thousand and twenty one"
  end

  def test_hundred_thousands_with_and
    assert_equal @eng.convert(111021), "one hundred eleven thousand and twenty one"
  end

  def test_hundred_millions_with_and
    assert_equal @eng.convert(111150021), "one hundred eleven million one hundred fifty thousand and twenty one"
  end

  def test_fractional_number
    assert_equal NoSupportForFractionalNumberOnCurrentLanguages.message, @eng.convert(0.1)
  end
  def test_hundred_random_numbers
    r = Random.new
    (1..63).each do |power|
      number = r.rand(10 ** power)
      assert @eng.convert(number), number
    end
  end
end
