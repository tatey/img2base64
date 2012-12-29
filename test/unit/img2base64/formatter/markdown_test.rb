require 'helper'
require 'img2base64/formatter/markdown'

class Img2Base64::Formatter::MarkdownTest < MiniTest::Unit::TestCase
  def test_data_uri_defaults_to_data_uri
    assert_equal Img2Base64::Formatter::DataURI, Img2Base64::Formatter::Markdown.new(Object.new).data_uri
  end

  def test_to_formatted_s_formats_file
    file = Object.new
    instance = MiniTest::Mock.new
    instance.expect :to_formatted_s, 'data:image/jpg;base64,ABC123=='
    klass = MiniTest::Mock.new
    klass.expect :new, instance, [file]
    formatter = Img2Base64::Formatter::Markdown.new file, data_uri: klass
    assert_equal '![](data:image/jpg;base64,ABC123==)', formatter.to_formatted_s
  end
end
