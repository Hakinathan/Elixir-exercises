defmodule BirdCount do
  def today([]), do: nil
  def today([head | _]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | list]), do: [head + 1 | list]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head  | tail]) do
    case head do
      0 -> true
      _ -> has_day_without_birds?(tail)
    end
  end

  def total(list) do
    case list do
      [head | tail] -> head + total(tail)
      _ -> 0
    end
  end

  def busy_days([]), do: 0
  def busy_days(list) do
    case list do
      [head | tail] when head > 4 -> 1 + busy_days(tail)
      [_ | tail] -> busy_days(tail)
    end
  end
end
