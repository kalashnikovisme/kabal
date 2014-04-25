require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_to_text
    assert Kabal.to_text 1
  end
end
