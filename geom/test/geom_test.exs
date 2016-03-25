defmodule GeomTest do
  use ExUnit.Case, async: true
  doctest Geom

  test "area of a rectangle" do
    assert Geom.area({:rectangle, 3, 4}) == 12
  end

  test "area of a triangle" do
    assert Geom.area({:triangle, 3, 5}) == 7.5
  end

  test "area of a ellipse" do
    assert_in_delta Geom.area({:ellipse, 2, 4}), 25.13274123, 0.0001
  end

  test "unknown shape" do
    assert Geom.area({:pentagon, 3, 7}) == 0
  end

  test "private function can't be called" do
    assert_raise UndefinedFunctionError, fn ->
      Geom.area(:rectangle, 1, 1)
    end
  end
end
