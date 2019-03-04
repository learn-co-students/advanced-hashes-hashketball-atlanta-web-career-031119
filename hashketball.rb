require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson"=>{number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, 
        "Reggie Evans"=>{number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}, 
        "Brook Lopez"=>{number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}, 
        "Mason Plumlee"=>{number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}, 
        "Jason Terry"=>{number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
      }, 
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien"=>{number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      "Bismak Biyombo"=>{number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      "DeSagna Diop"=>{number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      "Ben Gordon"=>{number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      "Brendan Haywood"=>{number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      
    }
    
  }
  }
end 

def num_points_scored(player)
  score = nil 
  game_hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?("#{player}")
       data.each do |player_name, stats|
        if player_name == "#{player}"
          stats.each do |stat, number|
            if stat == :points 
              score = number
            end
          end
        end
      end 
      end
    end
  end 
  score 
 end  
 
 def shoe_size(player)
    size = nil 
  game_hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?("#{player}")
       data.each do |player_name, stats|
        if player_name == "#{player}"
          stats.each do |stat, number|
            if stat == :shoe 
              size = number
            end
          end
        end
      end 
      end
    end
  end 
  size  
 end  
 
 def team_colors(team_name)
   new_array = nil 
   game_hash.each do |location, info|
     if info.values.include?(team_name)
       info.each do |attribute, data|
         if attribute == :colors
           new_array = data 
          end  
          
       end
     end
   end
   new_array
 end 
 
 def team_names
   new_array = []
   new_array.push(game_hash[:home][:team_name])
   new_array.push(game_hash[:away][:team_name])
   new_array
 end 
 
 def player_numbers(team_name)
   numbers_array = []
   game_hash.each do |location, teams|
    teams.each do |attribute, data|
      if data == team_name
        teams[:players].each do |a, b|
          b.each do |c, d|
            if c == :number 
              numbers_array.push(d)
            end 
          end
        end
    end 
   end 
   end
   numbers_array.sort
 end 
 
  def player_stats(player_name)
    players_stats = {} 
    game_hash.each do |location, teams|
      teams[:players].each do |attribute, data|
        if attribute == player_name
          players_stats = data
        end
      end
    end 
       players_stats 
  end 
  
  def shoe_size_list
    shoe_sizes = [] 
    game_hash.each do |location, teams|
      teams[:players].each do |attribute, data|
        data.each do |stat, value|
          if stat == :shoe 
            shoe_sizes.push(value)
          end
        end
      end
    end 
    shoe_sizes.sort 
  end 
         
def  big_shoe_rebounds
  rebounds = nil 
  list = shoe_size_list
  game_hash.each do |location, teams|
      teams[:players].each do |attribute, data|
        data.each do |s, value|
          
          if value == #{list.last}
           rebounds = data[:rebounds]
        end
      end
    end
  end
  rebounds 
end
         
         
         
         
         