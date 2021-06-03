defmodule CryptoApiWeb.Api.V1.CurrencyControllerTest do
  use CryptoApiWeb.ConnCase, async: true

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("content-type", "application/json")
      |> put_req_header("authorization", "token")

    {:ok, conn: conn}
  end

  describe "GET /api/v1/currencies" do
    test "list all currencies", %{conn: conn} do
      conn = get(conn, Routes.api_v1_currency_path(conn, :index))

      assert json_response(conn, 200) == %{
               "BRL" => 5.15,
               "CAD" => 1.44,
               "EUR" => 0.92
             }
    end
  end

  describe "PATCH /api/v1/crypto/btc" do
    test "update value from currency", %{conn: conn} do
      assert get_currencies() == %{
               "BRL" => 5.15,
               "CAD" => 1.44,
               "EUR" => 0.92
             }

      conn = patch(conn, "/api/v1/crypto/btc", currency: "BRL", value: 4.14)

      assert get_currencies() == %{
               "BRL" => 4.14,
               "CAD" => 1.44,
               "EUR" => 0.92
             }

      assert json_response(conn, 200) == %{"message" => "Valor alterado com sucesso!"}

      patch(conn, "/api/v1/crypto/btc", currency: "BRL", value: 5.15)
    end

    test "returns status 400 when currency data is invalid", %{conn: conn} do
      conn = patch(conn, "/api/v1/crypto/btc", currency: "INVALID", value: 4.14)

      assert json_response(conn, 400) == %{"currency" => ["Moeda inválida!"]}
    end
  end

  defp get_currencies do
    "currencies.json"
    |> File.read!()
    |> Jason.decode!()
  end
end
