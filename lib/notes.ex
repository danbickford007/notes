alias Note
alias Utils
alias Ui

defmodule Notes do

  def main(args) do
    start()
  end

  def start do
    Ui.get_choice()
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

  def remove_note do
    Note.remove()
    start()
  end

  def choose(choice) do
    case choice do
      "1" ->
        new_note()
      "2" ->
        view_notes()
      "3" ->
        remove_note()
      "exit" ->
        IO.puts "Bye..."
      _ ->
        start()
    end
  end

end

