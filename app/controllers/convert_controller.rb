class ConvertController < ApplicationController
  def index
@conversion = Cloudconvert::Conversion.new

@conversion.convert( "ps", "pdf", "http://icons.iconarchive.com/icons/gakuseisean/radium/256/png-file-icon.png")
  end
end
