defmodule Geom do
  @moduledoc """
  Provides geometry related functions.
  """

  @doc """
  Calculates the area of a rectangle, triangle, or ellipse.
  """
  def area(length \\ 1, width \\ 1) do
    length * width
  end
end

