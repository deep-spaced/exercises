defmodule ListsTest do
  use ExUnit.Case
  doctest Lists

  test "empty length list" do
    assert Lists.even_length?([]) == true
  end

  test "even length list" do
    assert Lists.even_length?([1, 2]) == true
  end

  test "odd length list" do
    assert Lists.even_length?([1]) == false
  end

end
