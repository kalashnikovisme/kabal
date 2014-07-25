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
  def test_hundred_random_numbers
    r = Random.new
    (1..63).each do |power|
      number = r.rand(10 ** power)
      assert @eng.convert(number), number
    end
  end
  def test_minus_one
    assert_equal "minus one", @eng.convert(-1)
  end
  def test_minus_one_million_and_one_and_one_and_one
    assert_equal "minus one hundred eleven million one hundred fifty thousand and twenty one", @eng.convert(-111150021)
  end
  def test_minus_one_hundred_fifty
    assert_equal "minus one hundred fifty", @eng.convert(-150)
  end
  def test_1_point_5
    assert_equal "one point five", @eng.convert(1.5)
    assert_equal "minus one point five", @eng.convert(-1.5)
  end
  def test_125_point_125
    assert_equal "one hundred twenty five point one hundred twenty five", @eng.convert(125.125)
    assert_equal "minus one hundred twenty five point one hundred twenty five", @eng.convert(-125.125)
  end
  def test_zero_point_one
    assert_equal "point one", @eng.convert(0.1)
    assert_equal "minus point one", @eng.convert(-0.1)
  end
end
