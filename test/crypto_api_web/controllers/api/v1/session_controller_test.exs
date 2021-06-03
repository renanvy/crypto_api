defmodule CryptoApiWeb.Api.V1.SessionControllerTest do
  use CryptoApiWeb.ConnCase, async: true

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("content-type", "application/json")

    {:ok, conn: conn}
  end

  describe "POST /api/v1/login" do
    test "returns token when user logged in with success", %{conn: conn} do
      conn =
        post(
          conn,
          Routes.api_v1_session_path(conn, :create, %{
            "email" => "renanvy@gmail.com",
            "password" => "123456"
          })
        )

      assert %{"token" => token} = json_response(conn, 201)
      assert token
    end

    test "returns error when user credentials are invalid", %{conn: conn} do
      conn =
        post(
          conn,
          Routes.api_v1_session_path(conn, :create, %{
            "email" => "invalid",
            "password" => "invalid"
          })
        )

      assert json_response(conn, 400) == %{"message" => "Campos inválidos"}
    end
  end
end
