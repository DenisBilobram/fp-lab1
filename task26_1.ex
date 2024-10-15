defmodule TaskMonolit do

  def find_recurring_cycle_length(q) do
    find_cycle(q, 1, %{}, 0)
  end

  defp find_cycle(_q, 0, _seen_remainders, _position) do
    0
  end

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

  @spec reciprocal_cycles_tail_recursive(number, number, number) :: {number, number}
  def reciprocal_cycles_tail_recursive(q \\ 2, max_period \\ 0, max_q \\ 2) do
    if q < 1000 do
      period = find_recurring_cycle_length(q)

      if period > max_period do
        reciprocal_cycles_tail_recursive(q + 1, period, q)
      else
        reciprocal_cycles_tail_recursive(q + 1, max_period, max_q)
      end
    else
      {max_q, max_period}
    end
  end

end

IO.puts(elem(TaskMonolit.reciprocal_cycles_tail_recursive(), 0))
