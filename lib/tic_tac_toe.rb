class TicTacToe

    attr_accessor :board

    def initialize
        @board = " ", " ", " ", " ", " ", " ", " ", " ", " "
    end

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
        puts "-----------"
        puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
        puts "-----------"
        puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        self.board[index] = token
    end

    def position_taken?(index)
        self.board[index] != " "
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        self.board.count {|position| position != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        index = input_to_index(gets)
        valid_move?(index) ? move(index, current_player) : turn
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && self.board[combo[0]] == self.board[combo[1]] && self.board[combo[1]] == self.board[combo[2]]
                return combo
            end
        end
    end

    def full?
        turn_count == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        won? ? self.board[won?[0]] : nil
    end

    def play
        turn until over?
        puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end