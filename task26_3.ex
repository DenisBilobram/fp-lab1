defmodule TaskModular do

  def find_recurring_cycle_length(q) do
    find_cycle(q, 1, %{}, 0)
  end

  defp find_cycle(_q, 0, _seen_remainders, _position), do: 0

  defp find_cycle(q, remainder, seen_remainders, position) do
    case Map.get(seen_remainders, remainder) do
      nil ->
        new_seen_remainders = Map.put(seen_remainders, remainder, position)
        new_remainder = rem(remainder * 10, q)
        find_cycle(q, new_remainder, new_seen_remainders, position + 1)
      initial_position ->
        position - initial_position
    end
  end

  def generate_sequence() do
    2..999
  end

  def calculate_cycles() do
    generate_sequence()
    |> Enum.map(&({&1, find_recurring_cycle_length(&1)}))
  end

  def find_max_cycle() do
    calculate_cycles()
    |> Enum.reduce({0, 0}, fn {q, length}, {max_q, max_length} ->
      if length > max_length do
        {q, length}
      else
        {max_q, max_length}
      end
    end)
  end
end

IO.puts(elem(TaskModular.find_max_cycle(), 0))
