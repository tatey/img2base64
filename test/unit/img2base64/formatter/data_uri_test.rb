require 'helper'
require 'img2base64/formatter/data_uri'

class Img2Base64::Formatter::DataURITest < MiniTest::Test
  def test_to_formatted_s_formats_file
    file = MiniTest::Mock.new
    file.expect :mime_type, 'image/jpg'
    file.expect :encode, 'ABC123=='
    formatter = Img2Base64::Formatter::DataURI.new file
    assert_equal 'data:image/jpg;base64,ABC123==', formatter.to_formatted_s
  end
end
