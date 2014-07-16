Cloudconvert.configure do |config|
require 'socket'

def local_ip
  orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily

  UDPSocket.open do |s|
    s.connect '64.233.187.99', 1
    s.addr.last
  end
ensure
  Socket.do_not_reverse_lookup = orig
end
    config.api_key  = "jUhrw6w8yuYA1cusmLm50KDBrU6NxZ3fWuTReTBHc5dcFQSGfrfgcIWZXegj4yWm-EVcgBv4MwuTOPPskiRvNA"
    config.callback = "http://#{local_ip}:3000/converts/c/q"
end