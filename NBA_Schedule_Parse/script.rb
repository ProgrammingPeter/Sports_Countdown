require_relative 'schedule.rb'
require_relative 'arrange_dates.rb'
require 'csv'


  arr_of_schedules = []
  ##Accesses the folder where the files are to take their names and store them in the array
  filename = Dir.entries("Path of CSV files to extract their names").select {|f| !File.directory? f}

  for x in 0..29

    File.open('Path of files' + filename[x], 'r') do |f1|  

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
    tempfile[0..-5] += "_Final" #Creates a new file with the original title and a "_Final" appended to differentiate the files

    i = 0
    while i < arr_of_schedules.size do 
      CSV.open(tempfile, "a+") do |csv|
        temp = arr_of_schedules[i] ##Accessing the first schedule in the array and inserting each row one by one with the appropriate data
        csv << [temp.return_gamenumber, temp.return_year, temp.return_month, temp.return_day, temp.return_hour, temp.return_ampm, temp.return_minute, temp.return_second, temp.return_timezone, temp.return_home_away, temp.return_opponent] 
        i+= 1

      end
    end

  #Erase contents of array for re-use
  arr_of_schedules.clear
end
