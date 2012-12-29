module Img2Base64
  class MimeType
    attr_reader :mime_type
    attr_reader :range
    attr_reader :header

    def initialize mime_type, range, header
      @mime_type = mime_type
      @range     = range
      @header    = header
    end

    def match? data
      data[range] == header
    end
  end
end
