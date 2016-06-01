defmodule Note do

  def new do 
    name = IO.gets "what is the name of this note? \n"
    content = IO.gets "What is the content of this note? \n"
    create(String.replace(name, "\n", ""), content)
  end

  def create(name, content) do
    File.write! "notes.json", elem(JSON.encode([name: name, content: content]), 1)
  end

  def all() do
    File.read "notes.json"
  end

end
