class Game
  attr_reader :frames, :current_frame

  VERSION = 1

  def initialize
    @frames = { 1 => [],
                2 => [],
                3 => [],
                4 => [],
                5 => [],
                6 => [],
                7 => [],
                8 => [],
                9 => [],
                10 => [],
                extra_points: []
              }
    @current_frame = 1
  end

  def roll(pins)
    @current_frame += 1 if tenth_frame_without_spare_or_strike? || (@current_frame != 10 && frame_complete?)
    check_for_invalid_roll(current_frame, pins)
    @frames[@current_frame] << pins
  end

  def score
    raise RuntimeError, 'Score cannot be taken until the end of the game' if game_not_over
    add_spares
    add_strikes
    add_all_pins
  end

  private
    def add_strikes
      all_frames = @frames.values.flatten
      all_frames.each_with_index do |roll, index|
        if roll == 10 && index < 18
          @frames[:extra_points] << all_frames[index + 1] unless !all_frames[index + 1]
          @frames[:extra_points] << all_frames[index + 2] unless !all_frames[index + 2]
        end
      end
    end

    def add_spares
      @frames.values.each_with_index do |frame, index|
        if frame.reduce(:+) == 10 && frame[0] != 10
          @frames[:extra_points] << @frames[index + 2][0] unless !@frames[index + 2][0]
        end
      end
    end

    def check_for_invalid_roll(current_frame, pins)
      if current_frame > 10
        raise RuntimeError, 'Should not be able to roll after game is over'
      end
      if pins < 0
        raise RuntimeError, 'Pins must have a value from 0 to 10'
      end
      if pins > 10
        raise RuntimeError, 'Pins must have a value from 0 to 10'
      end
      if @frames[current_frame][0] && (@frames[current_frame][0] + pins > 10) && current_frame != 10
        raise RuntimeError, 'Pin count exceeds pins on the lane'
      end
      if current_frame == 10 && @frames[@current_frame][1] && @frames[current_frame][1] != 10 && (@frames[current_frame][1] + pins > 10)
        raise RuntimeError, 'Pin count exceeds pins on the lane'
      end
    end

    def both_rolls_taken?
      @frames[@current_frame].length == 2
    end

    def spare?
      (@frames[@current_frame].reduce(:+) == 10 )
    end

    def tenth_frame_without_spare_or_strike?
      @current_frame == 10 && @frames[@current_frame].reduce(:+) < 10 && both_rolls_taken?
    end

    def frame_complete?
      (both_rolls_taken?) || spare?
    end

    def game_not_over
      @current_frame < 10 || (@current_frame == 10 && !@frames[@current_frame][1])
    end

    def add_all_pins
      score = @frames.values.flatten.reduce(:+)
      if score > 300
        score = 300
      end
      score
    end
end

class RuntimeError < StandardError
end
