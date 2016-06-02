defmodule UtilsTest do
  use ExUnit.Case
  doctest Utils 

  test "able to generate blank setup" do
    assert Utils.generate_blank() == "[]"
  end

  test "send original is ok" do
    assert Utils.has_errno({:ok, "OK HERE"}) == "OK HERE"
  end

  test "generates blank setup if errno" do
    assert Utils.has_errno({:errno, "Some error"}) == "[]"
  end

  test "generates blank setup if value is empty str" do
    assert Utils.has_errno({:ok, ""}) == "[]"
  end

end
