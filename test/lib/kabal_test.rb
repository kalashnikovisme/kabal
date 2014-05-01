require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_language_init
    Kabal.language = "Russian"
    assert_equal Kabal.current_language, "Russian"
  end

  def test_to_text
    assert_equal Kabal.to_text(125125125125), "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять"
  end
end
