require 'forwardable'
require 'img2base64/mime_type'

module Img2Base64
  class Registry
    extend Forwardable
    extend SingleForwardable

    include Enumerable

    def_instance_delegator :mime_types, :each
    def_single_delegator   :default, :register_mime_type

    attr_reader :mime_types
    attr_reader :mime_type

    def initialize options = {}
      @mime_type  = options.fetch :mime_type, MimeType
      @mime_types = []
    end

    def register_mime_type *args
      mime_types << mime_type.new(*args)
    end

    def self.default
      @default ||= new
    end
  end
end
