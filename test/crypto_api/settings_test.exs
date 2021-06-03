defmodule CryptoApi.SettingsTest do
  use CryptoApi.DataCase, async: true

  alias CryptoApi.Settings

  describe "list_currencies/0" do
    test "return all currencies from currencies.json file" do
      assert Settings.list_currencies() == %{"BRL" => 5.4, "CAD" => 1.44, "EUR" => 0.92}
    end
  end

  describe "update_currency/1" do
    test "update currency when params is valid" do
      assert {:ok, _currencies} =
               Settings.update_currency(%{"currency" => "BRL", "value" => 5.22})

      currencies = Settings.list_currencies()

      assert currencies["BRL"] == 5.22

      # Rollback value
      Settings.update_currency(%{"currency" => "BRL", "value" => 5.4})
    end

    test "returns error when params is valid" do
      assert {:error, _changeset} =
               Settings.update_currency(%{"currency" => "INVALID", "value" => 5.22})
    end
  end
end
