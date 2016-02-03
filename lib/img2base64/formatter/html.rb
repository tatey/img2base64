require 'img2base64/formatter/data_uri'

module Img2Base64
  module Formatter
    class HTML
      attr_reader :data_uri
      attr_reader :file

      def initialize file, options = {}
        @data_uri = options.fetch :data_uri, DataURI
        @file     = file
      end

      def to_formatted_s
        %{<img src="#{data_uri.new(file).to_formatted_s}">}
      end
    end
  end
end
