defmodule CryptoApiWeb.Plugs.AuthorizationTest do
  use CryptoApiWeb.ConnCase, async: true

  alias CryptoApiWeb.Plugs.Authorization

  describe "call/2" do
    test "returns unauthorized status when token not found in header", %{conn: conn} do
      conn =
        conn
        |> bypass_through()
        |> get("/api/v1/currencies")
        |> Authorization.call(%{})

      assert conn.status == 401
      assert conn.halted
    end

    test "authorize user when token is found in header", %{conn: conn} do
      conn =
        conn
        |> bypass_through()
        |> put_req_header("authorization", "token")
        |> get("/api/v1/currencies")
        |> Authorization.call(%{})

      assert conn.status != 401
    end
  end
end
