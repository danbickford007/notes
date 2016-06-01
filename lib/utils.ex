
defmodule Utils do

  def list_json(json) do
    json
    |> JSON.decode
    |> elem(1)
    |> Enum.reverse
    |> Enum.each &( print_key_value(elem(&1, 0), elem(&1, 1))) 
  end

  def print_key_value(key, value) do
    """
    ****************
    #{key}
    _______________
    #{value}
    ****************


    """
    |> IO.puts
  end

end
