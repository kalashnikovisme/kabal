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
end
