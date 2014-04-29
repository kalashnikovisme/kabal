require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_to_text
    assert_equal Kabal.to_text(99), "один"
  end
end
