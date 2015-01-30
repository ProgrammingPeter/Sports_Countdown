require_relative 'schedule.rb'
require_relative 'arrange_dates.rb'
require 'csv'


  arr_of_schedules = []
  ##Accesses the folder where the files are to take their names and store them in the array
  filename = Dir.entries("C:\\Users\\Peter\\Desktop\\Sports_Countdown\\NBA_Schedules").select {|f| !File.directory? f}

  for x in 0..29

    File.open('C:\\Users\\Peter\\Desktop\\Sports_Countdown\\NBA_Schedules\\' + filename[x], 'r') do |f1|  

    f1.gets # Skips the first empty line in every .csv

      while line = f1.gets  

      A_Schedule = parse_data(line)
      arr_of_schedules.push(A_Schedule)
      end 
    end

    #For some reason the code is rejecting my if statement in parse_data which fills in useless rows
    #problems at line 0,21,42,63,84 
    array_to_delete = [84,63,42,21,0]

    for i in array_to_delete
     arr_of_schedules.delete_at(i)
    end

    #For updates
    tempfile = filename[x]
    team_name = tempfile[6, 3] #Recording team's abbreviation for files ex-NYK, BOS
    tempfile[0..-5] += "_Final" #Creates a new file with the original title and a "_Final" appended to differentiate the files

    i = 0
    while i < arr_of_schedules.size do 
      CSV.open(tempfile, "a+") do |csv|
        temp = arr_of_schedules[i] ##Accessing the first schedule in the array and inserting each row one by one with the appropriate data

        tempdate = temp.return_year.to_s
        tempdate.concat("-")
        tempdate.concat(temp.return_month.to_s)
        tempdate.concat("-") 
        tempdate.concat(temp.return_day.to_s) 
        tempdate.concat(" ")
        tempdate.concat(temp.return_hour.to_s)
        tempdate.concat(":")
        tempdate.concat(temp.return_minute.to_s) 
        tempdate.concat(":")
        tempdate.concat(temp.return_second.to_s)

        home_team, away_team = arrange_home_away_teams(team_name, temp.return_opponent, temp.return_home_away)

        #Decided not to add game number
        csv << [tempdate , home_team, away_team, temp.return_televized, temp.return_network] 
        i+= 1

      end
    end

  #Erase contents of array for re-use
  arr_of_schedules.clear
end


#        csv << [temp.return_gamenumber, temp.return_year + "-" + temp.return_month +"-" + temp.return_day " " + temp.return_hour + ":" + temp.return_minute + ":" + temp.return_second, temp.return_month, temp.return_day, temp.return_hour, temp.return_ampm, temp.return_minute, temp.return_second, temp.return_timezone, temp.return_home_away, temp.return_opponent, temp.return_network, temp.return_televized] 
#temp.return_year + "-" + temp.return_month + "-" + temp.return_day + " " + temp.return_hour + ":" + temp.return_minute + ":" + temp.return_second