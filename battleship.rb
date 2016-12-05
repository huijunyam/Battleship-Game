require_relative "board"
require_relative "player"
require_relative "computerPlayer"

class BattleshipGame
    attr_reader :board, :player
  
    def initialize(player, board)
        @player = player 
        @board = board 
    end 
  
    def attack(pos)
        if board[pos] == :s
            puts "You hitted one ship"
            board[pos] = :SS
        elsif board.in_range?(pos)
            board[pos] = :x 
        end 
    end 
  
    def count
        board.count
    end 
    
    def game_over?
        board.won? 
    end
    
    def play_turn
        board.display
        puts "There are #{board.count} ships left"
        position = player.get_play 
        while board[position] == :x 
            position = player.get_play
        end 
        attack(position)
    end
    
    def play
        board.populate_grid(5)
        #ComputerPlayer.new(board).place_ship(5)
        
        until game_over?
            play_turn
        end 
        
        board.display 
        puts "You won"
    end 
end

if __FILE__ == $PROGRAM_NAME
    BattleshipGame.new(HumanPlayer.new("jun"), Board.new).play 
end 