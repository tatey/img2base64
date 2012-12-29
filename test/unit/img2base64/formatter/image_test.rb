require 'helper'
require 'img2base64/formatter/image'

class Img2Base64::Formatter::ImageTest < MiniTest::Unit::TestCase
  def test_to_formatted_s_formats_file
    file = MiniTest::Mock.new
    file.expect :mime_type, 'image/jpg'
    file.expect :encode, 'ABC123=='
    formatter = Img2Base64::Formatter::Image.new file
    assert_equal "data:image/jpg;base64,ABC123==", formatter.to_formatted_s
  end
end
