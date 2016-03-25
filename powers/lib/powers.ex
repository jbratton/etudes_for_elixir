defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
  A module with a function to do exponentiation.
  """

  @doc """
  A function to raise x to the n power.
  """
  def raise(_, 0), do: 1
  def raise(x, 1), do: x
  def raise(x, n) when n > 1, do: Powers.raise(x, n, 1)
  def raise(x, n) when n < 0, do: 1.0 / Powers.raise(x, -n)

  def raise(_, 0, accumulator), do: accumulator
  def raise(x, n, accumulator), do: Powers.raise(x, n - 1, x * accumulator)
end
