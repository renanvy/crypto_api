defmodule CryptoApiWeb.V1.BitcoinPriceController do
  use CryptoApiWeb, :controller

  alias CryptoApi.ExternalApis.CoinDesk
  alias CryptoApiWeb.Api.V1.BitcoinPriceView

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> put_view(BitcoinPriceView)
    |> render("index.json", %{data: CoinDesk.get_prices()})
  end
end
