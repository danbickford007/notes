
defmodule Ui do

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

  def get_name_and_content do
    name = IO.gets "what is the name of this note? \n"
    content = IO.gets "What is the content of this note? \n"
    {name, content}
  end

end
