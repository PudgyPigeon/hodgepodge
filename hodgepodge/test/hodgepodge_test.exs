defmodule HodgepodgeTest do
  use ExUnit.Case
  doctest Hodgepodge

  test "greets the world" do
    assert Hodgepodge.hello() == :world
  end
end
