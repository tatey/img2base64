require 'helper'
require 'img2base64/registry'

class Img2Base64::RegistryTest < MiniTest::Test
  def test_mime_type_is_mime_type
    assert_equal Img2Base64::MimeType, Img2Base64::Registry.new.mime_type
  end

  def test_mime_types_is_empty
    assert_empty Img2Base64::Registry.new.mime_types
  end

  def test_responds_to_each
    assert Img2Base64::Registry.new.respond_to?(:each)
  end

  def test_register_mime_type_registers_mime_type
    args     = ['image/gif', 0...4, 'GIF8']
    instance = Object.new
    klass    = MiniTest::Mock.new
    klass.expect :new, instance, args
    registry = Img2Base64::Registry.new mime_type: klass
    registry.register_mime_type *args
    assert_equal 1, registry.count
    assert_equal instance, registry.first
  end

  def test_default_is_registry
    registry = Img2Base64::Registry.default
    assert_equal registry.object_id, Img2Base64::Registry.default.object_id
    assert_instance_of Img2Base64::Registry, registry
  end
end
