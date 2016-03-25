defmodule PowersTest do
  use ExUnit.Case
  doctest Powers

  test "any number to the power 0 is 1" do
    assert Powers.raise(73, 0) == 1
  end

  test "any number to the power 1 is itself" do
    assert Powers.raise(342, 1) == 342
  end

  test "for positive n, x^n is x * x^(n-1)" do
    assert Powers.raise(3, 4) == 3 * Powers.raise(3, 3)
  end

  test "for negative n, x^n is 1.0/x^(-n)" do
    assert Powers.raise(3, -2) == 1.0 / Powers.raise(3, 2)
  end
end
