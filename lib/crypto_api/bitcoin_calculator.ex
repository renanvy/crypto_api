defmodule CryptoApi.BitcoinCalculator do
  def calculate(usd_rate, :brl) do
    get_currency_value("BRL")
    |> Decimal.mult(usd_rate)
    |> Decimal.to_float()
  end

  def calculate(usd_rate, :eur) do
    get_currency_value("EUR")
    |> Decimal.mult(usd_rate)
    |> Decimal.to_float()
  end

  def calculate(usd_rate, :cad) do
    get_currency_value("CAD")
    |> Decimal.mult(usd_rate)
    |> Decimal.to_float()
  end

  defp get_currency_value(currency_name) do
    File.read!("currencies-#{Mix.env()}.json")
    |> Jason.decode!()
    |> Map.fetch!(currency_name)
    |> Decimal.from_float()
  end
end
