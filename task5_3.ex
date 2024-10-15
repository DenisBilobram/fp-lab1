defmodule TaskModular do
  def lcm(a, b) do
    div(a * b, gcd(a, b))
  end

  defp gcd(a, 0), do: a
  defp gcd(a, b), do: gcd(b, rem(a, b))

  def generate_sequence() do
    1..20
  end

  def find_smallest_multiple() do
    generate_sequence()
    |> Enum.map_reduce(1, fn x, acc ->
        new_acc = lcm(acc, x)
        {new_acc, new_acc}
       end)
    |> elem(1)
  end
end

IO.puts(TaskModular.find_smallest_multiple())
