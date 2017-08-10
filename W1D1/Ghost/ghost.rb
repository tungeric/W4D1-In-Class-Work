require "set"
require_relative "./player.rb"

class GhostGame

  def initialize
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @players = [@player1, @player2].cycle
    @fragment = ""
    @dictionary = File.readlines("./dictionary.txt").to_set
    @current_player = nil
  end

  def play
    until over?
      next_player!
      take_turn(@current_player)
    end
    puts "#{@current_player.name} has lost the game!"
  end

  private

  def next_player!
    @current_player = @players.next
  end

  def get_play
    valid_move = nil
    until valid_move
      puts "The word so far is #{@fragment}."
      attempted_move = @current_player.make_play
      if valid_play?(attempted_move)
        valid_move = attempted_move
      else
        puts "That is not a valid move!"
      end
    end
    valid_move
  end


  def update_fragment(play)
    @fragment += play
  end

  def valid_play?(string)
    beginning = @dictionary.any? do |word|
      word.start_with?(@fragment+string)
    end
    alphabet = ("a".."z")
    letter = alphabet.include?(string)
    beginning && letter
  end

  def take_turn(player)
    play = get_play
    update_fragment(play)
  end

  def over?
    @dictionary.include?(@fragment + "\n")
  end
end

# class Waterbottle
#   attr_reader :size
#
#
#   @@number_of_waterbottles = 0
#
#   def initialize(size)
#     @size = size
#     @@number_of_waterbottles += 1
#   end
#
#   def fill
#     self
#     private_method
#
#   end
#
#   def size
#     @size
#   end
#
#   def size=(new_size)
#     @size = new_size
#   end
#
#   private
#
#   def private_method
# end
