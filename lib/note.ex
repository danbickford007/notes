alias Utils
alias Ui

defmodule Note do

  def new do 
    {name, content} = Ui.get_name_and_content()
    create(String.replace(name, "\n", ""), content)
  end

  def create(name, content) do
    data = all_to_enum
    |> List.insert_at(0, %{"name" => name, "content" => content})
    |> JSON.encode
    |> elem(1)
    
    File.write! "notes.json", data
  end

  def all_to_enum do
    all()
    |> JSON.decode
    |> elem(1)
    |> Enum.into [] 
  end

  def all() do
    File.read("notes.json")
    |> Utils.has_errno
  end

  def remove do
    all_to_enum()
      |> Ui.print_by_index
      |> destroy
  end

  def destroy(name) do
    all_to_enum
    |> Enum.each &(bye(name, &1))
  end

  def bye(name, note) do
    if name == Map.get(note, "name") do
      data = List.delete(all_to_enum(), note)
      |> JSON.encode
      |> elem(1)
      
      File.write! "notes.json", data
    end
  end

end
