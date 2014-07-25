require 'test_helper'

class EnglishTest < TestCase
  def setup
    @eng = Kabal::English.new
  end

  def test_single_number
    assert_equal "one", @eng.convert(1)
  end

  def test_two_words
    assert_equal "twenty one", @eng.convert(21)
  end

  def test_three_words
    assert_equal "one hundred twenty one", @eng.convert(121)
  end

  def test_three_words_with_and
    assert_equal "one hundred and two", @eng.convert(102)
  end

  def test_thousands
    assert_equal "eleven thousand one hundred twenty one", @eng.convert(11121)
  end

  def test_thousands_with_and
    assert_equal "eleven thousand and twenty one", @eng.convert(11021)
  end

  def test_hundred_thousands_with_and
    assert_equal "one hundred eleven thousand and twenty one", @eng.convert(111021)
  end

  def test_hundred_millions_with_and
    assert_equal "one hundred eleven million one hundred fifty thousand and twenty one", @eng.convert(111150021)
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
  def test_one_point_zero_five
    assert_equal "one point zero five", @eng.convert(1.05)
    assert_equal "minus one point zero five", @eng.convert(-1.05)
  end
  def test_one_point_zero_zero_zero_zero_zero_zero_zero_five
    assert_equal "one point zero zero zero zero zero zero zero five", @eng.convert(1.00000005)
    assert_equal "minus one point zero zero zero zero zero zero zero five", @eng.convert(-1.00000005)
  end
  def test_big_number
    assert_equal "forty seven novemdecillion twenty six octodecillion one hundred fifty seven septendecillion eight hundred twenty five sexdecillion six hundred twenty seven quindecillion nine hundred eighty quattuordecillion seven hundred thirty three tredecillion four hundred thirty nine duodecillion two hundred twenty five undecillion eight hundred twenty three decillion three hundred fifty three nonillion twenty nine octillion six hundred fifty seven septillion seven hundred forty five sextillion five hundred forty four quintillion six hundred forty six quadrillion seven hundred sixty one trillion eight hundred ninety billion seventy four million two hundred forty four thousand and three", @eng.convert(47026157825627980733439225823353029657745544646761890074244003)
  end
end
