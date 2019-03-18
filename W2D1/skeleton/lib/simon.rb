class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !game_over
       self.round_success_message 
       @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    seq.each do |color|
      system("clear")
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Enter colors separated by space:"
    resp = gets.chomp.split(' ')
    self.game_over = true if resp != self.seq
  end

  def add_random_color
    seq << COLORS.sample

  end

  def round_success_message
    puts "Eh that was just blind luck, let's go again"
  end

  def game_over_message
    puts "Game Over. That's what I thought"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
