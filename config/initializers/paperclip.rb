#This corrects a behavior of Paperclip that may make it incorrectly detect files with "spoofed" MIME types.
require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
Paperclip::Attachment.default_options[:use_timestamp] = false
