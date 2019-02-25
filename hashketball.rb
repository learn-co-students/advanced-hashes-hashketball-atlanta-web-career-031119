#game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, 
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, 
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, 
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, 
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

#num_points_scored
def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute.to_s == "players"
        data.each do |name, stats|
          if name == player 
            stats.each do |key, value|
              if key.to_s == "points" 
                return value
              end
            end
          end
        end
      end
    end
  end
end

#shoe_size
def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute.to_s == "players"
        data.each do |name, stats|
          if name == player 
            stats.each do |key, value|
              if key.to_s == "shoe" 
                return value
              end
            end
          end
        end
      end
    end
  end
end

#team_colors
def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |attribute, data|
        if attribute.to_s == "colors" 
          return data
        end
      end
    end
  end
end

#team_names
def team_names
  names_array = []
  game_hash.each do |location, team_data|
      team_data.each do |key, value|
        if key.to_s == "team_name"
          names_array << value
        end
      end
  end
  names_array
end

#player_numbers
# returns an array of the jersey number's for that team
def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |location, team_data|
    if team_data.values.include?(team_name)
      team_data.each do |attribute, data|
        if attribute.to_s == "players" 
          data.each do |name, stats|
            stats.each do |key, value|
              if key.to_s == "number"
                jersey_array << value
              end
            end
          end
        end
      end
    end
  end
  jersey_array
end

#player_stats
def player_stats(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute.to_s == "players"
        data.each do |name, stats|
          if name == player 
            return stats
          end
        end
      end
    end
  end
end

#big_shoe_rebounds
def big_shoe_rebounds
  
  largest_shoe = ""
  shoe_size = -1.0/0
  name_placeholder = ""
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute.to_s == "players"
        data.each do |name, stats|
           name_placeholder = name
           stats.each do |key, value|
             if key.to_s == "shoe"
               if value > shoe_size
                 shoe_size = value
                 largest_shoe = name_placeholder
               end
             end
           end
        end
      end
    end
  end
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute.to_s == "players"
        data.each do |name, stats|
          if name == largest_shoe 
            stats.each do |key, value|
              if key.to_s == "rebounds" 
                return value
              end
            end
          end
        end
      end
    end
  end
  
end







