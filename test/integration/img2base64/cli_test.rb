require 'helper'
require 'img2base64/cli'
require 'stringio'

class Img2Base64::CLITest < MiniTest::Unit::TestCase
  def setup
    @out = StringIO.new
    @cli = Img2Base64::CLI.new @out
  end

  def path filename
    File.expand_path "../../../fixtures/#{filename}", __FILE__
  end

  def test_help_command_prints_help
    @cli.run ['help']
    assert_includes @out.string, 'Usage'
  end

  def test_encode_command_with_no_args_prints_help
    @cli.run ['encode']
    assert_includes @out.string, 'Usage'
  end

  def test_encode_command_with_path_prints_data_uri
    @cli.run ['encode', path('grumpycat.jpg')]
    assert_includes @out.string, 'data:image/jpg;base64,/9j/'
  end

  def test_encode_command_with_path_and_formatter_prints_markdown
    @cli.run ['encode', path('grumpycat.jpg'), '-f', 'markdown']
    assert_includes @out.string, '![](data:image/jpg;base64,/9j/'
  end

  def test_empty_with_path_prints_data_uri
    @cli.run [path('grumpycat.jpg')]
    assert_includes @out.string, 'data:image/jpg;base64,/9j/'
  end
end
