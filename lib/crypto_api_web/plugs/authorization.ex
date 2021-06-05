defmodule CryptoApiWeb.Plugs.Authorization do
  @moduledoc """
  The Plug Authorization.
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    case get_authorization_token(conn) do
      {:ok, _token} ->
        conn

      _ ->
        conn
        |> send_resp(:unauthorized, Jason.encode!(%{message: "Token inválido"}))
        |> halt()
    end
  end

  defp get_authorization_token(conn) do
    with [token] <- get_req_header(conn, "authorization"),
         tokens <- File.read!("tokens-#{Mix.env()}.json") |> Jason.decode!(),
         {:ok, _email} <- Map.fetch(tokens, token) do
      {:ok, token}
    else
      _ -> {:error, :invalid_token}
    end
  end
end
