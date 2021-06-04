defmodule CryptoApi.ExternalApis.CoinDeskTest do
  use CryptoApi.DataCase, async: false

  alias CryptoApi.ExternalApis.CoinDesk
  alias CryptoApi.Mocks.OriginalCoinDeskMock
  alias CryptoApi.Mocks.ModifiedCoinDeskMock

  import Mock

  describe "get_prices/0" do
    test "returns bitcoin prices by currency" do
      with_mock HTTPoison, get: fn _url -> OriginalCoinDeskMock.get_prices() end do
        assert {:ok, result} = CoinDesk.get_prices()
        {:ok, modified_body} = ModifiedCoinDeskMock.get_prices()

        assert result == modified_body
      end
    end
  end
end
