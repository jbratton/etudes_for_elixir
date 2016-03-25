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

  @doc """
  A function to calculate the nth root of an integer using the Newton-Raphson method.
  """
  def nth_root(x, n), do: nth_root(x, n, x / 2.0)
  def nth_root(x, n, approximation) do
    IO.puts("Current guess is #{approximation}")
    delta = 1.0e-8

    f = Powers.raise(approximation, n) - x
    f_prime = n * Powers.raise(approximation, n - 1)

    next_approximation = approximation - f / f_prime

    change = abs(next_approximation - approximation)
    if change < delta do
      next_approximation
    else
      nth_root(x, n, next_approximation)
    end
  end
end
