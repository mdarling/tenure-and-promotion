Cloudconvert.configure do |config|
  config.api_key  = ENV["CLOUDCONVERT"] 
end

def local_ip
  if !ENV["WEB_HOSTNAME"]
    Socket.do_not_reverse_lookup = true  # turn off reverse DNS resolution temporarily
    UDPSocket.open do |s|
      s.connect '64.233.187.99', 1
      # If not specified, find the local ip for the machine
      s.addr.last
    end
  else
    # If the hostname was specified
    ENV["WEB_HOSTNAME"]
  end
end

