require 'yahoo_weatherman'

puts "Let's get your forecast for the next few days. Where are ya?"
user_response = gets.chomp

client = Weatherman::Client.new
user_location = client.lookup_by_location('user_response')

#local_condition = user_location.condition['text']
#local_temp = user_location.condition['temp']
local_forecast_five = user_location.forecasts

today = Time.now.strftime('%w').to_i

local_forecast_five.each do |forecast|
	day_of_week = forecast['date'].strftime('%w').to_i
	if day_of_week == today
		forecast_day = "Today"
	elsif day_of_week == today + 1
		forecast_day = "Tomorrow"
	else 
		forecast_day = forecast['date'].strftime("%A")
	end
	puts forecast_day + " is going to be " + forecast['text'] + " with a high of " + forecast['high'].to_s + " and a low of " + forecast['low'].to_s
end




