defmodule Dijkstra do
  @moduledoc """
  Provides a GCD function using Dijkstra's method.
  """

  @doc """
  Calculates the GCD of two integers using Dijkstra's method.
  """
  def gcd(m, n) when m == n do
    m
  end

  def gcd(m, n) when m > n do
    Dijkstra.gcd(m - n, n)
  end

  def gcd(m, n) when m < n do
    Dijkstra.gcd(m, n - m)
  end
end
