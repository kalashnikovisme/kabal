require 'test_helper'

class DeutschTest < TestCase
  def setup
    @deu = Kabal::Deutsch.new
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
end
