require "http"

system "clear"
puts "Welcome to the weather app!"

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=chicago&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")
weather_data = response.parse

temperature = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

puts "Today in Chicago it is #{temperature} degrees Farenheit outside with #{description}!"
