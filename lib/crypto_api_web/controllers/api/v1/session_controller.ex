defmodule CryptoApiWeb.V1.SessionController do
  use CryptoApiWeb, :controller

  alias CryptoApi.Accounts
  alias CryptoApiWeb.Api.V1.SessionView

  def create(conn, session_attrs) do
    case Accounts.login(session_attrs) do
      {:ok, token} ->
        conn
        |> put_status(201)
        |> put_view(SessionView)
        |> render("create.json", %{token: token})

      {:error, :invalid_login} ->
        conn
        |> put_status(400)
        |> put_view(SessionView)
        |> render("invalid_login.json")
    end
  end
end
