defmodule TakeANumber do
  def start() do
    initial_state = 0
    spawn(fn -> loop(initial_state) end)
  end

  defp loop(state) do
    receive do
      {:take_a_number, sender_pid} ->
        new_state = state + 1
        send(sender_pid, new_state)
        loop(new_state)

      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      :stop ->
        Process.exit(self(), :normal)

      _ ->
        loop(state)
    end
  end
end
