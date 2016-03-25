defmodule DijkstraTest do
  use ExUnit.Case
  doctest Dijkstra

  test "gcd" do
    assert Dijkstra.gcd(2, 2) == 2
    assert Dijkstra.gcd(14, 21) == 7
    assert Dijkstra.gcd(125, 46) == 1
  end
end
