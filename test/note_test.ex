defmodule NoteTest do
  use ExUnit.Case
  doctest Note

  test "creates a new note" do
    Note.create("test", "hellotest")
    data = File.read "notes.json"
    assert data == 2
  end
end
