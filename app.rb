require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

get '/weather' do
  data=`sudo /home/pi/Adafruit_Python_DHT/examples/AdafruitDHT.py 2302 4`
  array=data.chomp.to_s.split(',') 
  
  weather = {
    temperature: "#{array[0]}",
    humidity: "#{array[1]}"
  }

  weather.to_json
end
