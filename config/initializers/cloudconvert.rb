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
    config.api_key  = "eNePD1_gRa02Owh7D_uKtYIjNr58yMO5ML4BUjOfuT3btA-GU1l14eqbNGiic4UmFVeRKcEgpuxDK9X7nzFhrA"
    config.callback = "http://#{local_ip}:3000/cloud"
end
