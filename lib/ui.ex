
defmodule Ui do

  def get_choice do
    IO.gets """
    
      1. Create Note
      2. View Notes
      3. Remove Note 
      exit End program

    """
  end

  def recent_note_header do
    """
      
      Recent notes:

    """
    |> IO.puts
  end

  def print_name_content(%{"name" => name, "content" => content}) do
    """
    ****************
    #{name}
    _______________
    #{content}
    ****************


    """
    |> IO.puts
  end

  def print_by_index(notes) do
    IO.puts "Which one to delete?\n"

    notes
    |> Enum.each &(IO.puts Map.get(&1, "name"))

    choice = IO.gets "Enter the name of the note to remove:\n"
    String.replace(choice, "\n", "")
  end

  def get_name_and_content do
    name = IO.gets "what is the name of this note? \n"
    content = IO.gets "What is the content of this note? \n"
    {String.replace(name, "\n", ""), content}
  end

end
