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
    IO.inspect(conn)

    case get_req_header(conn, "authorization") do
      [token] when token != nil and token != "" -> {:ok, token}
      _ -> {:error, :missing_token}
    end
  end
end
