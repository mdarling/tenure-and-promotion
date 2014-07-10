class ConvertController < ApplicationController
  def index
@conversion = Cloudconvert::Conversion.new

# to start file conversion (options & callback_url parameters are optional)
# for versions <=0.0.4
#conversion.convert(inputformat, outputformat, file_path, options)

# for versions >=0.0.5 (callback_url passing enabled for each conversion)
#conversion.convert(inputformat, outputformat, file_path, callback_url, options)

# options parameter is Conversion type specific options , which you can get from, 
#conversion.converter_options
#it will return all possible conversion types and possible options(inputformat and outputformat are optional)

# to list all conversions
#conversion.list_conversions

# to cancel conversion                                            
#conversion.cancel_conversion    

# to delete conversion                                        
#conversion.delete_conversion

# to get download link of completed conversion
#conversion.download_link                                                  

# to get current status of conversion
#conversion.status
  end
end
