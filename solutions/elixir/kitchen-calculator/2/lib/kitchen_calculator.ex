defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)
  def to_milliliter({unit, value}), do: {:milliliter, value * ratio(unit)}
  def from_milliliter(volume_pair, unit), do: {unit, get_volume(volume_pair) / ratio(unit)}
  def convert(volume_pair, unit), do:  from_milliliter(to_milliliter(volume_pair), unit)

  defp ratio(:milliliter), do: 1
  defp ratio(:cup), do: 240
  defp ratio(:fluid_ounce), do: 30
  defp ratio(:teaspoon), do: 5
  defp ratio(:tablespoon), do: 15
end
