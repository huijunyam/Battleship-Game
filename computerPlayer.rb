class ComputerPlayer
    attr_reader :board 

    def initialize(board)
        @board = board
    end
    
    def place_ship(num_ships)
        populate_grid(num_ships).each { |pos| board[pos] = :s }
    end 
    
    private
    def populate_grid(num_ships)
        ships = []
        
        until ships.length == num_ships
            pos = [rand(board.grid.length), rand(board.grid[0].length)]
            ships << pos if !ships.include?(pos)
        end 
        
        ships 
    end 
end 