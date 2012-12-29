require 'helper'
require 'img2base64/mime_type'

class Img2Base64::MimeTypeTest < MiniTest::Unit::TestCase
  def setup
    @mime_type = Img2Base64::MimeType.new 'image/gif', 0...4, 'GIF8'
  end

  def test_match_is_true
    assert @mime_type.match?('GIF8')
  end

  def test_match_is_false
    refute @mime_type.match?("\x89PNG")
  end
end
