defmodule CryptoApi.BitcoinCalculatorTest do
  use CryptoApi.DataCase, async: true

  alias CryptoApi.BitcoinCalculator

  describe "calculate/2" do
    setup do
      usd_rate = Decimal.from_float(38940.1933)

      {:ok, %{usd_rate: usd_rate}}
    end

    test "convert bitcoin price to BRL (Brazilian Real)", %{usd_rate: usd_rate} do
      assert BitcoinCalculator.calculate(usd_rate, :brl) == 200541.995495
    end

    test "convert bitcoin price to EUR (Euro)", %{usd_rate: usd_rate} do
      assert BitcoinCalculator.calculate(usd_rate, :eur) == 35824.977836
    end

    test "convert bitcoin price to CAD (Canadian Dolar)", %{usd_rate: usd_rate} do
      assert BitcoinCalculator.calculate(usd_rate, :cad) == 56073.878352
    end
  end
end
