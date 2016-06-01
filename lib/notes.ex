alias Note

defmodule Notes do

  def get_choice do
    IO.gets """
    
      1. Create Note
      2. View Notes
      exit End program

    """
  end

  def start do
    String.replace(get_choice(), "\n", "")
    |> choose
  end

  def new_note do 
    Note.new() 
    start()
  end

  def view_notes do
    notes = """
      
      Recent notes:

    """
    data = Note.all()
    IO.puts notes
    IO.puts elem(data, 1)
    start()
  end

  def choose(choice) do
    case choice do
      "1" ->
        new_note()
      "2" ->
        view_notes()
      "exit" ->
        IO.puts "Bye..."
      _ ->
        start()
    end
  end

end


Notes.start()
