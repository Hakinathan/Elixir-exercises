defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 and is_integer(input) do
    calc_steps(input, 0)
  end

  defp calc_steps(1, steps), do: steps
  defp calc_steps(input, steps) do
    next_input = if rem(input, 2) == 0 do
      div(input, 2)
    else
      (input * 3) + 1
    end
    calc_steps(next_input, steps + 1)
  end
end
