class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
        @a = a
        @b = b
        @c = c
  end

  def kind
    validate_triangle
    case
      when a== b && b == c
        :equilateral
      when a == b || b == c || a == c
        :isosceles      
      else
        :scalene
      end
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangles_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? and valid_triangles_inequality?
  end

  class TriangleError < StandardError
  end

end
