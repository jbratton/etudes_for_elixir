defmodule AskArea do
  @moduledoc """
  Provides an area() function that prompts for a shape and dimensions and
  returns the shape's area.
  """

  @doc """
  This method will prompt the user to enter a letter representing a supported
  shape and then to enter the appropriate parameters of the shape. It will 
  then use these parameters to calculate the area of the shape.
  """
  @spec area :: number
  def area do
    shape_prompt = "R)ectangle, T)riangle, or E)llipse: "

    shape_letter = IO.gets(shape_prompt) |> String.strip
    shape = shape_letter |> String.upcase |> letter_to_shape

    if shape == :unknown do
      IO.puts "Unknown shape #{shape_letter}"
    else
      {prompt_1, prompt_2} = dimension_prompts(shape)
      {dimension_1, dimension_2} = get_dimensions(prompt_1, prompt_2)
      calculate(shape, dimension_1, dimension_2)
    end
  end

  @spec dimension_prompts(atom) :: {String.t, String.t}
  defp dimension_prompts(shape) do
    cond do
      shape == :rectangle -> {"Enter width > ", "Enter height > "}
      shape == :triangle  -> {"Enter base > ", "Enter height > "}
      shape == :ellipse   -> {"Enter major radius > ", "Enter minor radius > "}
    end
  end

  @spec letter_to_shape(String.t) :: atom
  defp letter_to_shape(letter) do
    cond do
      letter == "R" -> :rectangle
      letter == "T" -> :triangle
      letter == "E" -> :ellipse
      true -> :unknown
    end
  end

  @spec get_number(String.t) :: integer
  defp get_number(prompt) do
    IO.gets(prompt) |>
    String.strip |>
    String.to_integer
  end

  @spec get_dimensions(String.t, String.t) :: {integer, integer}
  defp get_dimensions(prompt_1, prompt_2) do
    {get_number(prompt_1), get_number(prompt_2)}
  end

  @spec calculate(atom, integer, integer) :: number
  defp calculate(:unknown, _, _) do
    IO.puts "Unknown shape"
  end

  defp calculate(_, dimension_1, dimension_2) when dimension_1 < 0 or dimension_2 < 0 do
    IO.puts "Both numbers must be greater than or equal to zero."
  end

  defp calculate(shape, dimension_1, dimension_2) when is_integer(dimension_1) and is_integer(dimension_2) do
    Geom.area({shape, dimension_1, dimension_2})
  end

  defp calculate(_, _, _) do
    IO.puts "Both dimensions must be integers."
  end
end

