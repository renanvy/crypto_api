defmodule CryptoApiWeb.V1.CurrencyController do
  use CryptoApiWeb, :controller

  alias CryptoApi.Settings

  def index(conn, _params) do
    currencies = Settings.list_currencies()

    conn
    |> put_status(200)
    |> json(currencies)

  end

  def update(conn, params) do
    case Settings.update_currency(params) do
      {:ok, _currencies} ->
        conn
        |> put_status(200)
        |> json(%{message: "Valor alterado com sucesso!"})

      {:error, changeset} ->
        conn
        |> put_status(400)
        |> put_view(CryptoApiWeb.ErrorView)
        |> render("error.json", %{changeset: changeset})
    end
  end
end
