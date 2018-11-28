defmodule PatmatchTest do
  use ExUnit.Case
  doctest Patmatch

  test "greets the world" do
    assert Patmatch.hello() == :world
  end

  test "swaps the values" do
    assert Patmatch.swap({2, 5}) == {5, 2}
  end

  test "value are not equal" do
    assert Patmatch.equals(2, 4) == false
  end

  test "value are equal" do
    assert Patmatch.equals(2, 2) == true
  end
end
