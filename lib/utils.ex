alias Ui

defmodule Utils do

  def list_json(json) do
    json
    |> JSON.decode
    |> elem(1)
    |> Enum.reverse
    |> Enum.each &( Ui.print_name_content(&1)) 
  end

  def has_errno({key, value}) do
    if key == :errno or value == "" do
      generate_blank()
    else
      value 
    end
  end

  def generate_blank do
    JSON.encode([])
    |> elem(1)
  end

end
