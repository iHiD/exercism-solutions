defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    to_label(level, legacy?)
    |> then(& cond do 
      &1 == :error -> :ops
      &1 == :fatal -> :ops
      &1 == :unknown and legacy? -> :dev1
      &1 == :unknown -> :dev2
      true -> nil
    end)
  end
end
