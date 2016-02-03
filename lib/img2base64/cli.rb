require 'img2base64/file'
require 'img2base64/formatter/data_uri'
require 'img2base64/formatter/markdown'
require 'img2base64/formatter/html'
require 'img2base64/version'

module Img2Base64
  class CLI
    FORMATS = {
      '-f datauri'  => Formatter::DataURI,
      '-f markdown' => Formatter::Markdown,
      '-f html' => Formatter::HTML
    }

    attr_reader :out

    def initialize out
      @out = out
    end

    def run argv
      command = "#{argv[0]}_command"
      if respond_to? command, true
        send command, argv[1..-1]
      else
        encode_command argv
      end
    end

  protected

    def help_command args
      out.puts 'Usage: img2base64 <FILE> [-f format]'
      out.puts '       img2base64 ~/screenshot.png'
      out.puts '       img2base64 ~/screenshot.png -f markdown'
      out.puts '       img2base64 ~/screenshot.png -f html'
    end

    def encode_command args
      path      = args[0]
      formatter = FORMATS.fetch (args[1..2] || []).join(' '), Formatter::DataURI
      unless path
        help_command args
        return
      end
      out.puts formatter.new(File.new(read(path))).to_formatted_s
    end

    def version_command args
      out.puts "img2base64 #{Img2Base64::VERSION} (Ruby #{RUBY_VERSION})"
    end

    def read path
      ::File.read ::File.expand_path(path)
    end
  end
end
