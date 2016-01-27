class Series
  attr_reader :series

  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > series.length
    number_of_slices = series.length - slice_size
    (0..number_of_slices).to_a.map do |start_index|
      series[start_index, slice_size]
    end
  end
end
