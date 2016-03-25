defmodule Geom do
  @moduledoc """
  Provides geometry related functions.
  """

  @doc """
  Calculates the area of a rectangle, triangle, or ellipse.
  """
  def area({shape, dimension_1, dimension_2}) do
    area(shape, dimension_1, dimension_2)
  end

  defp area(shape, dimension_1, dimension_2) when dimension_1 >= 0 and dimension_2 >= 0 do
    case {shape} do
      {:rectangle} -> dimension_1 * dimension_2
      {:triangle} -> dimension_1 * dimension_2 / 2.0
      {:ellipse} -> :math.pi() * dimension_1 * dimension_2
      other -> 0
    end
  end

# defp area(:rectangle, length, width) when length >= 0 and width >= 0 do
#   length * width
# end

# defp area(:triangle, base, height) when base >= 0 and height >= 0 do
#   base * height / 2.0
# end

# defp area(:ellipse, radius_1, radius_2) when radius_1 >= 0 and radius_2 >= 0 do
#   :math.pi() * radius_1 * radius_2
# end

# defp area(_, _, _) do
#   0
# end
end
