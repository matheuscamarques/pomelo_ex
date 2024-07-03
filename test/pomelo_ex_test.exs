defmodule PomeloExTest do
  use ExUnit.Case
  doctest PomeloEx

  test "greets the world" do
    assert PomeloEx.hello() == :world
  end
end
