module Img2Base64
  module Formatter
    class Image
      attr_reader :file

      def initialize file
        @file = file
      end

      def to_formatted_s
        "data:#{file.mime_type};base64,#{file.encode}"
      end
    end
  end
end
