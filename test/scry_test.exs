defmodule ScryTest do
  use ExUnit.Case
  doctest Scry

  test "greets the world" do
    assert Scry.hello() == :world
  end
end
