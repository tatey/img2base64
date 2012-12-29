require 'helper'
require 'img2base64'

class Img2Base64Test < MiniTest::Unit::TestCase
  def test_registry_gif
    gif = Img2Base64::Registry.default.mime_types[0]
    assert_equal 'image/gif', gif.mime_type
  end

  def test_registry_jpg
    jpg = Img2Base64::Registry.default.mime_types[1]
    assert_equal 'image/jpg', jpg.mime_type
  end

  def test_registry_png
    png = Img2Base64::Registry.default.mime_types[2]
    assert_equal 'image/png', png.mime_type
  end
end
