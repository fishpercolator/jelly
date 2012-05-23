module JellyDates
	
	# Returns a crude approximation of the previous working day based on m-f week
	def self.previous_working_day(from=Date.today)
		d = from - 1
		until d.wday.between?(1,5)
		  d -= 1
		end
		d
	end

end

