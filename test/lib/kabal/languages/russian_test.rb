require 'test_helper'

class RussianTest < TestCase
  def setup
    @rus = Kabal::Russian.new
  end

  def test_zero_number
    assert_equal "ноль", @rus.convert(0)
    assert_equal "ноль", @rus.convert(-0)
  end

  def test_to_text_with_single_number
    assert_equal "один", @rus.convert(1)
    assert_equal "минус один", @rus.convert(-1)
  end
  def test_to_text_with_two_words_number
    assert_equal "двадцать пять", @rus.convert(25)
    assert_equal "минус двадцать пять", @rus.convert(-25)
  end
  def test_to_text_with_three_words_number
    assert_equal "шестьсот двадцать пять", @rus.convert(625)
    assert_equal "минус шестьсот двадцать пять", @rus.convert(-625)
  end
  def test_to_text_with_ten_powers
    assert_equal "сто двадцать пять тысяч шестьсот двадцать пять", @rus.convert(125625)
    assert_equal "минус сто двадцать пять тысяч шестьсот двадцать пять", @rus.convert(-125625)
  end
  def test_to_text_with_ten_powers_millions
    assert_equal "сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять", @rus.convert(125125625)
    assert_equal "минус сто двадцать пять миллионов сто двадцать пять тысяч шестьсот двадцать пять", @rus.convert(-125125625)
  end
  def test_to_text_with_ten_powers_some_number
    assert_equal "один миллион один", @rus.convert(1000001)
    assert_equal "минус один миллион один", @rus.convert(-1000001)
  end
  def test_to_text_with_google
    assert_equal "гугол", @rus.convert(10 ** 100)
    assert_equal "минус гугол", @rus.convert(-(10 ** 100))
  end
  def test_to_text_with_three_words_without_second_order
    assert_equal "сто один", @rus.convert(101)
    assert_equal "минус сто один", @rus.convert(-101)
  end
  def test_to_text_with_three_words_without_first_and_second_order
    assert_equal "двести", @rus.convert(200)
    assert_equal "минус двести", @rus.convert(-200)
  end
  def test_to_text_with_thousands
    assert_equal "двадцать две тысячи", @rus.convert(22000)
    assert_equal "минус двадцать две тысячи", @rus.convert(-22000)
  end
  def test_to_text_with_negative_number
    assert_equal NumberOutRangeError.new.message, @rus.convert(-(10 ** 103))
  end
  def test_to_text_with_fractional_number_with_zero
    assert_equal "ноль целых одна сотая", @rus.convert(0.01)
    assert_equal "минус ноль целых одна сотая", @rus.convert(-0.01)
  end
  def test_to_text_with_fractional_number
    assert_equal "одна целая пять сотых", @rus.convert(1.05)
    assert_equal "минус одна целая пять сотых", @rus.convert(-1.05)
  end
  def test_to_text_with_fractional_number_like_whole
    assert_equal "один", @rus.convert(1.0)
    assert_equal "минус один", @rus.convert(-1.0)
  end
  def test_to_text_with_fractional_number_with_preword
    assert_equal "одна целая пять десятитысячных", @rus.convert(1.0005)
    assert_equal "минус одна целая пять десятитысячных", @rus.convert(-1.0005)
  end
  def test_to_text_with_fractional_number_with_exp_form
    assert_equal "одна целая пять стомиллиардных", @rus.convert(1.00000000005)
    assert_equal "минус одна целая пять стомиллиардных", @rus.convert(-1.00000000005)
  end
  def test_to_text_with_some_number
    assert_equal "одна целая двадцать три миллиона пятьсот шестьдесят семь тысяч восемьсот девяносто одна стомиллионная", @rus.convert(1.23567891)
  end
  def test_to_text_with_number_from_random
    assert_equal "восемь дуотригинтиллионов девятьсот семь антригинтиллионов восемьдесят пять тривигинтиллионов шестьсот двадцать девять новемвигинтиллионов семьсот девяносто октовигинтиллионов восемьсот шестьдесят шесть септемвигинтиллионов пятьсот тридцать восемь сексвигинтиллионов восемьсот тринадцать квинвигинтиллиона восемьсот сорок семь кватторвигинтиллионов шестьсот два тревигинтиллиона шестьсот двенадцать дуовигинтиллиона семьсот тридцать три анвигинтиллиона шестьсот семьдесят семь вигинтиллионов двести шестьдесят шесть новемдециллионов восемьсот шестьдесят два октодециллиона девятьсот двадцать один септемдециллион шестьсот сексдециллионов семьдесят четыре квиндециллиона семьсот сорок пять кваттуордециллионов пятьсот сорок два тредециллиона пятьсот девяносто девять дуодециллионов шестьсот андециллионов четыреста сорок дециллионов пятьсот восемьдесят девять нониллионов девятьсот семьдесят семь октиллионов семьсот восемьдесят семь септиллионов шестьсот восемь секстиллионов пятьсот пятьдесят восемь квинтиллионов четыреста семьдесят шесть квадраллионов двести восемьдесят девять триллионов пятьсот тридцать миллиардов четыреста восемь миллионов шестьсот пятьдесят девять тысяч двести тридцать два", @rus.convert(8907085629790866538813847602612733677266862921600074745542599600440589977787608558476289530408659232)
  end
  def test_hundred_random_numbers
    r = Random.new
    (1..100).each do |power|
      number = r.rand(10 ** power)
      assert @rus.convert(number), number
    end
  end
  def test_11000
    assert_equal "одиннадцать тысяч", @rus.convert(11000)
  end
  def test_111000
    assert_equal "сто одиннадцать тысяч", @rus.convert(111000)
  end
  def test_zero_point_zero_zero_zero_zero_zero_zero_zero_five
    assert_equal "ноль целых пять стомиллионных", @rus.convert(0.00000005)
    assert_equal "минус ноль целых пять стомиллионных", @rus.convert(-0.00000005)
  end
end
