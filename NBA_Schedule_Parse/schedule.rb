class Schedule

	def initialize(year, month, day, hour, minutes, time_zone, opponent, gamenumber, home_away) #Default constructor
		@game_number = gamenumber
		@year = year
		@month = month
		@day = day
		@hour = hour
		@ampm = "pm"
		@minute = minutes
		@second = 0
		@time_zone = time_zone
		@opponent = opponent
		@home_away = home_away
	end

	def return_year()
		return @year
	end

	def return_gamenumber()
		return @game_number
	end

	def return_month()
		return @month
	end

	def return_day()
		return @day
	end

	def return_hour()
		return @hour
	end

	def return_minute()
		return @minute
	end

	def return_home_away()
		return @home_away
	end

	def return_opponent()
		return @opponent
	end

	def return_second()
		return @second
	end

	def return_ampm()
		return @ampm
	end

	def return_timezone()
		return @time_zone
	end
end