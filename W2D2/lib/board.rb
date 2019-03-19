class Board
  attr_accessor :cups

  def initialize(name1, name2)
    i = 0
    @player1, @player2 = name1, name2
    @cups = Array.new(14) {i += 1; i % 7 == 0 ? [] : Array.new(4) {:stone} }
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !((0..5).to_a + (7..12).to_a).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    
    if current_player_name == @player1
      first_player = true
    else
      first_player = false
    end
    drop_pos = start_pos
    @cups[start_pos].length.times do 
      drop_pos += 1
      if drop_pos == 6 && !first_player
        drop_pos += 1
      elsif drop_pos == 13 && first_player
        drop_pos += 1
      end
      drop_pos = drop_pos % 14
      @cups[drop_pos] << :stone
    end
    @cups[start_pos] = []
    self.render
    next_turn(drop_pos, first_player)
  end

  def next_turn(ending_cup_idx, first_player)
    return :prompt if (first_player && ending_cup_idx == 6) || (!first_player && ending_cup_idx == 13)
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? {|cup| cup.empty?}
      return true
    elsif @cups[7..12].all? {|cup| cup.empty?}
      return true
    end
    return false
  end

  def winner
    if cups[6].length > cups[13].length
      return @player1
    elsif cups[6].length < cups[13].length
      return @player2
    else
      return :draw
    end
  end
end
