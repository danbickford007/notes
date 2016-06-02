
defmodule NoteTest do
  use ExUnit.Case
  doctest Note

  setup_all do
    {:ok, hi_message: [%{"content" => "says hi", "name" => "dan"}]}
  end

  setup do
    File.write! "notes.json", ""
  end

  test "with empty file" do
    data = Note.all()
    assert data == "[]"
  end

  test "returning proper data" do
    data = Note.all_to_enum()
    assert data == []
  end

  test "creates a note", context do
    Note.create("dan", "says hi")
    assert Note.all_to_enum() == context[:hi_message] 
  end

  test "destroys a note", context do
    Note.create("dan", "says hi")
    assert Note.all_to_enum() == context[:hi_message] 
    Note.destroy("dan")
    assert Note.all_to_enum() == []
  end

end
