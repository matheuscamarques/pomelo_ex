defmodule PomeloEx.Cards.SensitiveInformation.Handling.DisplaySensitiveInformation do
  @moduledoc false

  alias PomeloEx.Types.Cards.SensitiveInformation.Handling.DisplaySensitiveInformationType

  def execute(%DisplaySensitiveInformationType{card_id: card_id} = payload) do
    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:card_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.map(fn
        {:field_list, value} when is_list(value) -> {"field_list", Enum.join(value, ",")}
        {k, v} -> {Atom.to_string(k), v}
      end)
      |> URI.encode_query()

    base_url = Application.get_env(:pomelo_ex, :secure_data_url, "https://pomelo.la/secure-data")
    url = "#{base_url}/#{card_id}"

    {:ok, "#{url}?#{params}"}
  end
end
