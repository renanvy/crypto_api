defmodule CryptoApi.AccountsTest do
  use CryptoApi.DataCase, async: true

  alias CryptoApi.Accounts

  describe "login/1" do
    test "returns token if login data is valid" do
      payload = %{"email" => "renanvy@gmail.com", "password" => "123456"}

      assert {:ok, token} = Accounts.login(payload)
      assert token
    end

    test "returns error when login data is invalid" do
      payload = %{"email" => "invalid-email", "password" => "invalid-password"}

      assert {:error, _changeset} = Accounts.login(payload)
    end
  end
end
