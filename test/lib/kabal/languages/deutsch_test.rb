require 'test_helper'

class DeutschTest < TestCase
  def setup
    @deu = Kabal::Deutsch.new
  end

  def test_zero_number
    assert_equal "null", @deu.convert(0)
    assert_equal "null", @deu.convert(-0)
  end

  def test_single_number
    assert_equal "eins", @deu.convert(1)
  end

  def test_two_words_with_eins
    assert_equal "einundzwanzig", @deu.convert(21)
  end

  def test_two_words
    assert_equal "zweiunddreißig", @deu.convert(32)
  end

  def test_three_words
    assert_equal "einhunderteinundzwanzig", @deu.convert(121)
  end

  def test_three_words_with_and
    assert_equal "einhundertzwei", @deu.convert(102)
  end

  def test_thousands
    assert_equal "elftausendeinhunderteinundzwanzig", @deu.convert(11121)
  end

  def test_thousands_with_and
    assert_equal "elftausendeinundzwanzig", @deu.convert(11021)
  end

  def test_hundred_thousands_with_and
    assert_equal "einhundertelftausendeinundzwanzig", @deu.convert(111021)
  end

  def test_hundred_millions_with_and
    assert_equal "einhundertelf Millionen einhundertfünfzigtausendeinundzwanzig", @deu.convert(111150021)
  end
  def test_hundred_random_numbers
    r = Random.new
    (1..23).each do |power|
      number = r.rand(10 ** power)
      assert @deu.convert(number), number
    end
  end
  def test_minus_one
    assert_equal "minus eins", @deu.convert(-1)
  end
  def test_minus_one_million_and_one_and_one_and_one
    assert_equal "minus einhundertelf Millionen einhundertfünfzigtausendeinundzwanzig", @deu.convert(-111150021)
  end
  def test_minus_one_hundred_fifty
    assert_equal "minus einhundertfünfzig", @deu.convert(-150)
  end
  def test_1_point_5
    assert_equal "eins Komma fünf", @deu.convert(1.5)
    assert_equal "minus eins Komma fünf", @deu.convert(-1.5)
  end
  def test_125_point_125
    assert_equal "einhundertfünfundzwanzig Komma einhundertfünfundzwanzig", @deu.convert(125.125)
    assert_equal "minus einhundertfünfundzwanzig Komma einhundertfünfundzwanzig", @deu.convert(-125.125)
  end
  def test_zero_point_one
    assert_equal "null Komma eins", @deu.convert(0.1)
    assert_equal "minus null Komma eins", @deu.convert(-0.1)
  end
  def test_one_point_zero_five
    assert_equal "eins Komma null fünf", @deu.convert(1.05)
    assert_equal "minus eins Komma null fünf", @deu.convert(-1.05)
  end
  def test_one_point_zero_zero_zero_zero_zero_zero_zero_five
    assert_equal "eins Komma null null null null null null null fünf", @deu.convert(1.00000005)
    assert_equal "minus eins Komma null null null null null null null fünf", @deu.convert(-1.00000005)
  end
end
