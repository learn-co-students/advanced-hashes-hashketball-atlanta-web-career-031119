require 'pry'

def game_hash
    game_hash = {home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:{"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
               "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
               "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
               "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
               "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}}
          },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:{"Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
               "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
               "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
               "Ben Gordon" =>  {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
               "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}}
        }
      }
      return game_hash
end

def num_points_scored(player)
  game_hash.each {|loc, team|
    team.each  {|attr, data|
      if attr == :players
        data.each { |name, stats|
            if name == player
              stats.each {|k, v|
                if k == :points
                  return v
                  end}
                end}
              end}}
            end

def shoe_size(player)
  game_hash.each {|loc, team|
    team.each  {|attr, data|
      if attr == :players
        data.each { |name, stats|
            if name == player
              stats.each {|k, v|
                if k == :shoe
                  return v
                  end}
                end}
              end}}
            end

def team_colors(team)
  game_hash.each do |loc, team_data|
    team_data.each do |attr, data|
      if data == team
        result = team_data.fetch(:colors)
        return result.join(" ").split
            end
          end
        end
      end

def team_names
    teams = []
    teams << game_hash[:home][:team_name]
    teams << game_hash[:away][:team_name]
    return teams
  end

def player_numbers(team)
  team_numbers = []
  game_hash.each {|loc, team_data|
    team_data.each  {|attr, data|
      if game_hash[loc][attr] == team
        game_hash[loc][:players].each {|name, stats|
          team_numbers << game_hash[loc][:players][name][:number]
        }
      end
    }
  }
  return team_numbers
end

def player_stats(player)
  game_hash.each {|loc, team_data|
    team_data.each {|attr, data|
      if attr == :players
        data.each {|name, stats|
          if name == player
        return game_hash[loc][:players][name]
      end}
     end}
    }
  end

  def big_shoe_rebounds
    biggest_shoe = nil
    game_hash.each {|loc, team_data|
    team_data[:players].each {|name, stats|
      biggest_shoe ||= stats
      biggest_shoe ||= stats[:shoe] > biggest_shoe[:shoe]
      }}
      return biggest_shoe[:rebounds]
  end

  def most_points_scored
    most_points = nil
    mvp = nil
    game_hash.each {|loc, team_data|
      team_data.each{|attr, data|
          team_data[:players].each {|name, stats|
          most_points ||= game_hash[loc][:players][name][:points]
          mvp = name if game_hash[loc][:players][name][:points] > most_points
          most_points = game_hash[loc][:players][name][:points] if game_hash[loc][:players][name][:points] > most_points
          }}}
      return mvp
    end

  def winning_team
    winner = nil
    score1 = []
    score2 = []
      game_hash[:home][:players].each {|attr, data|
        score1 << data[:points]
      }
      game_hash[:away][:players].each {|attr, data|
      score2 << data[:points]
    }
   return score1.reduce(:+) > score2.reduce(:+) ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
  end

  def player_with_longest_name
    longest = nil
    game_hash.each {|loc, team_data|
      team_data[:players].each {|name, stats|
        longest ||= name
        longest = name if name.size > longest.size
          }}
        return longest
      end

  def long_name_steals_a_ton?
    most_steals = nil
    player_name = nil
    game_hash.each {|loc, team_data|
      team_data.each{|attr, data|
          team_data[:players].each {|name, stats|
          most_steals ||= game_hash[loc][:players][name][:steals]
          player_name = name if game_hash[loc][:players][name][:steals] > most_steals
          most_steals = game_hash[loc][:players][name][:steals] if game_hash[loc][:players][name][:steals] > most_steals
          }}}
      return player_name == player_with_longest_name ? true : false
    end
