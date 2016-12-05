require_relative "board"
require_relative "player"
require_relative "ship"

class BattleshipGame
    attr_reader :player1, :player2, :current_player, :opponent, :current_board 
  
    def initialize(player1, player2)
        @player1 = player1 
        @player2 = player2
        @current_player = player1
        @opponent = player2 
        @current_board = player2.board
    end 
  
    def attack(pos)
        if current_board[pos] == :s
            puts "You have hit one of the part of the ship"
            opponent.update_list(pos)
            current_board[pos] = :SS
        elsif current_board.in_range?(pos)
            current_board[pos] = :x 
        end 
    end 
  
    def game_over?
        player1.hit_list.count("-") == 5 || player2.hit_list.count("-") == 5
    end 
    
    def play_turn
        current_board.display
        opponent.update_details
        position = current_player.get_play
        
        while current_board[position] == :x || current_board[position] == :SS
            puts "The coordinate is occupied, please give another position"
            position = current_player.get_play
        end
        attack(position)
        
        if current_board.won?
            puts "#{current_player.name} won"
        else 
            switching_players
        end 
    end
    
    def play
        game_setup
        until game_over?
            play_turn
        end 
    end
    
    def game_setup
        player1.player_setup 
        player2.player_setup 
    end 
        
    def switching_players
        if current_player == player1 
            @current_player = player2
            @opponent = player1
            @current_board = player1.board 
        else 
            @current_player = player1
            @opponent = player2
            @current_board = player2.board 
        end 
    end 
end

if __FILE__ == $PROGRAM_NAME
    BattleshipGame.new(HumanPlayer.new("hui", Ship.new), HumanPlayer.new("jun", Ship.new)).play 
end 