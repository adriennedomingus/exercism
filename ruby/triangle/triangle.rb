class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    if illegal_triangle?
      raise TriangleError
    else
      triangle_kind
    end
  end

  def triangle_kind
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  def equilateral?
    @sides[0] == @sides[1] && @sides[1] == @sides[2]
  end

  def isosceles?
    @sides.uniq.length == 2
  end

  def illegal_triangle?
    @sides.any? { |side| side <= 0 } || inequal_triangle?
  end

  def inequal_triangle?
    @sides[0] >= @sides[1] + @sides[2] ||
    @sides[1] >= @sides[0] + @sides[2] ||
    @sides[2] >= @sides[1] + @sides[0]
  end
end

class TriangleError < StandardError
end
