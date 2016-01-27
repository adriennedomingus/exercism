class Series
  attr_reader :series

  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > series.length
    all_slices = []
    series.each_with_index do |character, index|
      unless series[index + (slice_size - 1)] == nil
        slice = []
        until slice.length == slice_size
          slice << series[(index += 1) - 1 ]
        end
        all_slices << slice
      end
    end
    all_slices
  end
end
