defmodule CryptoApi.SettingsTest do
  use CryptoApi.DataCase, async: true

  alias CryptoApi.Settings

  describe "list_currencies/0" do
    test "return all currencies from currencies.json file" do
      assert Settings.list_currencies() == %{"BRL" => 5.4, "CAD" => 1.44, "EUR" => 0.92}
    end
  end
end
