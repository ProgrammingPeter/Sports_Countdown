
def parse_data(line)

      if line[0] != "G"  #This is because we have empty lines

        gamenumber, year, month, day, line = get_date(line)

        hour, minutes, time_zone, line = get_time(line)

        home_away, opponent, network, televized = get_arena_opponent(line)

        temp = Schedule.new(year, month, day, hour, minutes, time_zone, opponent, gamenumber, home_away, network, televized)
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
      network = line[0, index] #Grabs network game will be televized on
      line = line[index+1, line.size]
      index = line.index(",")
      line = line[index+1, line.size]

      if(network.empty?)
        televized = 0
      else
        televized = 1
      end

      if line[0] == "@"
        home_away = line[0, 1]
      end

      index = line.index(",")
      line = line[index+1, line.size]

      index = line.index(",")
      opponent = line[0,index]

      opponent = team_abbr(opponent)

      return home_away, opponent, network, televized
    end

    def arrange_home_away_teams(teamA, teamB, away_home)


        if away_home == "@" #teamA will end up being the home team, and teamB will end up being the away team
          temp = teamA
          teamA = teamB
          teamB = temp
          return teamA, teamB
        end

      else
        return teamA, teamB

    end


    def team_abbr(opponent)

      if(opponent == "Atlanta Hawks")
        return opponent = "ATL"
      end

      if(opponent == "Boston Celtics")
        return opponent = "BOS"
      end

      if(opponent == "Brooklyn Nets")
        return opponent = "BKN"
      end

      if(opponent == "Chicago Bulls")
        return opponent = "CHI"
      end

      if(opponent == "Charlotte Hornets")
        return opponent = "CHA"
      end

      if(opponent == "Cleveland Cavaliers")
        return opponent = "CLE"
      end

      if(opponent == "Dallas Mavericks")
        return opponent = "DAL"
      end

      if(opponent == "Denver Nuggets")
        return opponent = "DEN"
      end

      if(opponent == "Detroit Pistons")
        return opponent = "DET"
      end
      
      if(opponent == "Golden State Warriors")
        return opponent = "GSW"
      end

      if(opponent == "Houston Rockets")
        return opponent = "HOU"
      end

      if(opponent == "Indiana Pacers")
        return opponent = "IND"
      end

      if(opponent == "Los Angeles Clippers")
        return opponent = "LAC"
      end

      if(opponent == "Los Angeles Lakers")
        return opponent = "LAL"
      end
      
      if(opponent == "Memphis Grizzlies")
        return opponent = "MEM"
      end

      if(opponent == "Miami Heat")
        return opponent = "MIA"
      end

      if(opponent == "Milwaukee Bucks")
        return opponent = "MIL"
      end

      if(opponent == "Minnesota Timberwolves")
        return opponent = "MIN"
      end

      if(opponent == "New Orleans Pelicans")
        return opponent = "NOP"
      end

      if(opponent == "New York Knicks")
        return opponent = "NYK"
      end
      
      if(opponent == "Oklahoma City Thunder")
        return opponent = "OKC"
      end

      if(opponent == "Orlando Magic")
        return opponent = "ORL"
      end

      if(opponent == "Philadelphia 76ers")
        return opponent = "PHI"
      end

      if(opponent == "Phoenix Suns")
        return opponent = "PHX"
      end

      if(opponent == "Portland Trail Blazers")
        return opponent = "POR"
      end

      if(opponent == "Sacramento Kings")
        return opponent = "SAC"
      end

      if(opponent == "San Antonio Spurs")
        return opponent = "SAS" 
      end
      
      if(opponent == "Toronto Raptors")
        return opponent = "TOR"
      end

      if(opponent == "Utah Jazz")
        return opponent = "UTA"
      end

      if(opponent == "Washington Wizards")
        return opponent = "WAS"
      end
end