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
  def test_to_text_with_fractional_number_with_zero
    assert_equal @rus.convert(0.01), "ноль целых одна сотая"
  end
  def test_to_text_with_fractional_number
    assert_equal @rus.convert(1.05), "одна целая пять сотых"
  end
  def test_to_text_with_fractional_number_like_whole
    assert_equal @rus.convert(1.0), "один"
  end
  def test_to_text_with_fractional_number_with_preword
    assert_equal @rus.convert(1.0005), "одна целая пять десятитысячных"
  end
  def test_to_text_with_fractional_number_with_exp_form
    assert_equal @rus.convert(1.00000000005), "одна целая пять стомиллиардных"
  end
  def test_to_text_with_some_number
    assert_equal @rus.convert(1.23567891), "одна целая двадцать три миллиона пятьсот шестьдесят семь тысяч восемьсот девяносто одна стомиллионная"
  end
  def test_to_text_with_number_from_random
    assert_equal @rus.convert(8907085629790866538813847602612733677266862921600074745542599600440589977787608558476289530408659232), "восемь дуотригинтиллионов девятьсот семь антригинтиллионов восемьдесят пять тривигинтиллионов шестьсот двадцать девять новемвигинтиллионов семьсот девяносто октовигинтиллионов восемьсот шестьдесят шесть септемвигинтиллионов пятьсот тридцать восемь сексвигинтиллионов восемьсот тринадцать квинвигинтиллиона восемьсот сорок семь кватторвигинтиллионов шестьсот два тревигинтиллиона шестьсот двенадцать дуовигинтиллиона семьсот тридцать три анвигинтиллиона шестьсот семьдесят семь вигинтиллионов двести шестьдесят шесть новемдециллионов восемьсот шестьдесят два октодециллиона девятьсот двадцать один септемдециллион шестьсот сексдециллионов семьдесят четыре квиндециллиона семьсот сорок пять кваттуордециллионов пятьсот сорок два тредециллиона пятьсот девяносто девять дуодециллионов шестьсот андециллионов четыреста сорок дециллионов пятьсот восемьдесят девять нониллионов девятьсот семьдесят семь октиллионов семьсот восемьдесят семь септиллионов шестьсот восемь секстиллионов пятьсот пятьдесят восемь квинтиллионов четыреста семьдесят шесть квадраллионов двести восемьдесят девять триллионов пятьсот тридцать миллиардов четыреста восемь миллионов шестьсот пятьдесят девять тысяч двести тридцать два"
  end
  def test_hundred_random_numbers
    r = Random.new
    (1..100).each do |power|
      number = r.rand(10 ** power)
      assert @rus.convert(number), number
    end
  end
  def test_11000
    assert_equal @rus.convert(11000), "одиннадцать тысяч"
  end
  def test_111000
    assert_equal @rus.convert(111000), "сто одиннадцать тысяч"
  end
end
