class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # code your input_to_index and move method here!
  def input_to_index (index)
    @index = index
    @index.to_i - 1
   end


  def move (index, char)
    @board[index] = char
      end

      # code your #position_taken? method here!
  def position_taken?(i)
    if @board[i] == " " || @board[i] == ""
           false
        elsif @board[i] == nil
           false
        elsif
          @board[i] == "X" || @board[i] == "O"
           true
        end
      end

      # code your #valid_move? method here
      def valid_move?(i)
        if i.between?(0,8) && !position_taken?(i)
              true
           end
          end

      # code your #turn method here
      def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          puts "Incorrect entry. Try again."
          turn
        end
      end

      def turn_count
        counter = 0
        @board.each do |element|
          if element == "O" || element == "X"
            counter += 1
          end
        end
        return counter
      end

      def current_player
       if turn_count % 2 == 0
         "X"
       else
         "O"
       end
       end

       def won?
         WIN_COMBINATIONS.find do |win_combo|
            @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
         end
       end

       def full?
         @board.all? do |board_element|
           board_element =="X" || board_element == "O"
         end
       end

       def draw?
        if !won? && full?
          true
        else
          false
        end
       end

       def over?
         won? || draw? || full?
       end

       def winner
         if index = won?
           @board[index.last]
         end
       end

       # Define your play method below
       def play
          while !over?
            turn
          end
            if won?
              puts "Congratulations #{winner}!"
            elsif draw?
              puts "Cat's Game!"
            end
          end

        end
