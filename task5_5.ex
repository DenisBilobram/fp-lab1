defmodule TaskModular do
  # нок
  def lcm(a, b) do
    div(a * b, gcd(a, b))
  end

  # нод
  defp gcd(a, 0), do: a
  defp gcd(a, b), do: gcd(b, rem(a, b))

  def generate_sequence() do
    Stream.iterate(1, fn x -> x + 1 end)
      |> Stream.take(20)
  end

  def find_smallest_multiple() do
    generate_sequence()
    |> Enum.reduce(&lcm/2)
  end
end

IO.puts(TaskModular.find_smallest_multiple())
