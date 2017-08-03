require_relative "./ghost.rb"

class Player
  attr_reader :name

  def initialize(name)
    @name= name
  end

  def make_play
    puts "#{@name} please enter a letter."
    gets.chomp
  end

end
