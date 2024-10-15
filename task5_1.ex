defmodule TaskMonolit do

  @spec smallest_multiple_tail_recursive(number) :: number
  def smallest_multiple_tail_recursive(n \\ 1) do
    if Enum.all?(1..20, fn x -> rem(n, x) == 0 end) do
      n
    else
      smallest_multiple_tail_recursive(n+1);
    end
  end

  @spec smallest_multiple_recursive(number) :: number
  def smallest_multiple_recursive(n \\ 1) do
    if Enum.all?(1..20, fn x -> rem(n, x) == 0 end) do
      n
    else
      next_value = smallest_multiple_recursive(n + 1)
      next_value
    end
  end
end

IO.puts(TaskMonolit.smallest_multiple_tail_recursive());
