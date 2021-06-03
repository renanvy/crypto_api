defmodule CryptoApiWeb.Api.V1.BitcoinPriceControllerTest do
  use CryptoApiWeb.ConnCase, async: true

  alias CryptoApi.Mocks.CoinDeskMock
  alias CryptoApi.ExternalApis.CoinDesk

  import Mock

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("content-type", "application/json")
      |> put_req_header("authorization", "token")

    {:ok, conn: conn}
  end

  describe "GET /api/v1/crypto/btc" do
    test "list bitcoin prices per currency", %{conn: conn} do
      {:ok, prices} = CoinDeskMock.get_prices()

      with_mock CoinDesk, get_prices: fn -> {:ok, prices} end do
        conn = get(conn, Routes.api_v1_bitcoin_price_path(conn, :index))
        assert json_response(conn, 200) == prices
      end
    end
  end
end
