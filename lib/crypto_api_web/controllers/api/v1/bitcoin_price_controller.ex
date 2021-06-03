defmodule CryptoApiWeb.V1.BitcoinPriceController do
  use CryptoApiWeb, :controller

  alias CryptoApi.ExternalApis.CoinDesk
  alias CryptoApiWeb.Api.V1.BitcoinPriceView

  def index(conn, _params) do
    {:ok, prices} = CoinDesk.get_prices()

    conn
    |> put_status(200)
    |> put_view(BitcoinPriceView)
    |> render("index.json", %{data: prices})
  end
end
