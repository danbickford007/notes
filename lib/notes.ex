alias Note
alias Utils
alias Ui

defmodule Notes do

  def get_choice do
    IO.gets """
    
      1. Create Note
      2. View Notes
      exit End program

    """
  end

  def start do
    get_choice()
    |> String.replace("\n", "")
    |> choose
  end

  def new_note do 
    Note.new() 
    start()
  end

  def view_notes do
    Ui.recent_note_header()

    Note.all
    |> Utils.list_json
    |> IO.puts
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
