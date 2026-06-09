defmodule PomeloEx.Adapter do
  @callback request(
              method :: atom(),
              url :: String.t(),
              body :: term(),
              headers :: list({String.t(), String.t()})
            ) :: {:ok, PomeloEx.Adapter.Response.t()} | {:error, term()}
end
