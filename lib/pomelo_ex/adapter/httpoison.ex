defmodule PomeloEx.Adapter.HTTPoison do
  @behaviour PomeloEx.Adapter

  @impl true
  def request(method, url, body, headers) do
    HTTPoison.request(method, url, body, headers, [])
    |> normalize()
  end

  defp normalize({:ok, %HTTPoison.Response{status_code: status, body: body, headers: headers}}) do
    {:ok, %PomeloEx.Adapter.Response{status: status, body: body, headers: headers}}
  end

  defp normalize({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}
  end
end
