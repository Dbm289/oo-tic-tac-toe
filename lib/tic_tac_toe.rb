class TicTacToe

    def initialize
        @board = Array.new(9, " ")

    end

    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def input_to_index(num_string)
    @choose = num_string.to_i-1


end

def move(input_to_index, person = "X")
    @board [input_to_index] = person

end

def position_taken?(input_to_index)
    if @board[input_to_index] == "X" || @board[input_to_index] == "O"
        true
    else 
        false

    end
end

def valid_move?(input_to_index)
    !position_taken?(input_to_index) && @board[input_to_index]


end

def turn_count
    count = 0
    @board.each do |i|
        count += 1 if i == "X" || i == "O"
    end
    count
end

def current_player
    if turn_count.odd?
        "O"
    else 
        "X"
    end


end

def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        turn
    end

    
    
    

end

def won?
    WIN_COMBINATIONS.detect do | win |
        @board[win[0]] == @board[win[1]] &&
        @board[win[1]] == @board[win[2]] &&
        position_taken?(win[0])
    end




end

end