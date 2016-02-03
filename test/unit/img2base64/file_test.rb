require 'helper'
require 'img2base64/file'
require 'img2base64/mime_type'

class Img2Base64::FileTest < MiniTest::Test
  def test_encoder_defaults_to_base64
    assert_equal Base64, Img2Base64::File.new('').encoder
  end

  def test_registry_defaults_to_registry_default
    assert_equal Img2Base64::Registry.default, Img2Base64::File.new('').registry
  end

  def test_encode_encodes_and_strips_whitespace
    data    = "\nAB\rC123\r\n"
    encoder = MiniTest::Mock.new
    encoder.expect :encode64, data, [data]
    file = Img2Base64::File.new data, encoder: encoder
    assert_equal 'ABC123', file.encode
  end

  def test_mime_type_finds_mime_type_from_registry
    data     = "GIF8\nAB\rC123\r\n"
    registry = [Img2Base64::MimeType.new('image/gif', 0...4, 'GIF8')]
    file     = Img2Base64::File.new data, registry: registry
    assert_equal 'image/gif', file.mime_type
  end
end
