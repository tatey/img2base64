require 'base64'
require 'img2base64/registry'

module Img2Base64
  class File
    attr_reader :data
    attr_reader :encoder
    attr_reader :registry

    def initialize data, options = {}
      @data     = data
      @encoder  = options.fetch :encoder, Base64
      @registry = options.fetch :registry, Registry.default
    end

    def encode
      encoder.encode64(data).gsub(/\r|\n/, '')
    end

    def mime_type
      registry.find { |mime_type| mime_type.match? data }.mime_type
    end
  end
end
