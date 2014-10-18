
def parse_data(line)

      if line[0] != "G"  #This is because we have empty lines

        gamenumber, year, month, day, line = get_date(line)

        hour, minutes, time_zone, line = get_time(line)

        home_away, opponent = get_arena_opponent(line)

        temp = Schedule.new(year, month, day, hour, minutes, time_zone, opponent, gamenumber, home_away)
        return temp

      end

    end


    def define_month(month)

      if month == "Oct"
        return month = 10
      end

      if month == "Nov"
        return month = 11
      end

      if month == "Dec"
        return month = 12
      end

      if month == "Jan"
        return month = 1
      end

      if month == "Feb"
        return month = 2
      end

      if month == "Mar"
        return month = 3
      end

    else
      return month = 4

    end

    def get_date(line)

      ##Format of Date is "Wed Oct 29 2014" 
      ## We will be skipping the 3 spaces and getting the index of the 3rd space

      index = line.index(',') #gets index of wanted character

      gamenumber = line[0, index]

      line = line[index+1, line.size] #starts from after the pos found above and keeps everything


      index = line.index(",")
      game_date = line[0, index]###########################################
      line[index+1, line.size]

      year = game_date[game_date.size-4, game_date.size]
      month = game_date[4,3]

      month = define_month(month)######################################

      ##Meant to get the day
      index = game_date.index(" ")
      game_date = game_date[index+1, game_date.size]
      index = game_date.index(" ")
      game_date = game_date[index+1, game_date.size]
      index = game_date.index(" ")
      day = game_date[0, index+1]

      return gamenumber, year, month, day, line
    end


    def get_time(line)

      index = line.index(",")
      line = line[index+1, line.size]


      index = line.index(":")
      hour = line[0, index]

      otherindex = line.index("p")
      minutes = line[index+1, otherindex-2]

      if minutes.size == 3
        minutes = minutes[0,2]
      end

      index = line.index("T")
      time_zone = line[index-3, index-4]

      if time_zone.size == 5
        time_zone = time_zone[0, 4]
      end

      return hour, minutes, time_zone, line
    end

    def get_arena_opponent(line)

      index = line.index(",")
      line = line[index+1, line.size]
      index = line.index(",")
      line = line[index+1, line.size]
      index = line.index(",")
      line = line[index+1, line.size]


      if line[0] == "@"
        home_away = line[0, 1]
      end

      index = line.index(",")
      line = line[index+1, line.size]

      index = line.index(",")
      opponent = line[0,index]

      return home_away, opponent
    end