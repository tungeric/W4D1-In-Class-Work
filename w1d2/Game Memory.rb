require_relative 'Board Memory'
require_relative 'Card Memory'
require_relative 'HumanPlayer Memory'

class Game



  def initialize(player1=HumanPlayer.new, player2=nil)
    @board = Board.new
    @player1 = player1
    @player2 = player2
    @players = player2 ? [@player1, @player2].cycle : [@player1].cycle
    @current_player = @players.next
  end

  def play
    loop do
      system('clear')
      @board.render
      first_guess = choose_card
      second_guess = choose_card
      handle_pair(first_guess, second_guess)
      sleep(2)
      break if @board.won?
      switch_players!
    end

    puts "Congrats, #{current_player.name} win!"
  end

  def get_guess
    guess = nil

    loop do
      guess = @current_player.guess
      break if valid_guess?(guess)

      puts "That is not a valid guess."
    end
    guess
  end

  def valid_guess?(guess)
    @board[guess] && !@board[guess].revealed?
  end


  private

  def handle_pair(first_guess, second_guess)

    unless @board[second_guess] == @board[first_guess]
      @board[first_guess].hide!
      @board[second_guess].hide!
    end
  end

  def choose_card
    guess = get_guess
    @board.reveal(guess)
    @board.render
    guess
  end

  def switch_players!
    @current_player = @players.next
  end



end

if __FILE__ == $0
  Game.new.play
end
