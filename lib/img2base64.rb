# encoding: UTF-8

require 'img2base64/formatter/data_uri'
require 'img2base64/file'
require 'img2base64/mime_type'
require 'img2base64/registry'

module Img2Base64
  Registry.register_mime_type 'image/gif', 0...4, 'GIF8'
  Registry.register_mime_type 'image/jpg', 0...4, "\xFF\xD8\xFF\xE0"
  Registry.register_mime_type 'image/png', 0...4, "\x89PNG"

  def self.encode path
    Formatter::DataURI.new(File.new(::File.read(::File.expand_path(path)))).to_formatted_s
  end
end
