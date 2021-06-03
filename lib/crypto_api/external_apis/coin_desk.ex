defmodule CryptoApi.ExternalApis.CoinDesk do
  @endpoint "https://api.coindesk.com/v1/bpi/currentprice/BTC.json"

  alias CryptoApi.BitcoinCalculator

  def get_prices() do
    case HTTPoison.get(@endpoint) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok,
         body
         |> Jason.decode!()
         |> insert_rate(:brl)
         |> insert_rate(:eur)
         |> insert_rate(:cad)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp insert_rate(data, :brl) do
    usd_rate = Decimal.from_float(data["bpi"]["USD"]["rate_float"])
    rate_float = BitcoinCalculator.calculate(usd_rate, :brl)

    bpi =
      Map.merge(data["bpi"], %{
        "BRL" => %{
          "code" => "BRL",
          "description" => "Brazilian Real",
          "rate" => Number.Delimit.number_to_delimited(rate_float),
          "rate_float" => rate_float
        }
      })

    Map.put(data, "bpi", bpi)
  end

  defp insert_rate(data, :eur) do
    usd_rate = Decimal.from_float(data["bpi"]["USD"]["rate_float"])
    rate_float = BitcoinCalculator.calculate(usd_rate, :eur)

    bpi =
      Map.merge(data["bpi"], %{
        "EUR" => %{
          "code" => "EUR",
          "description" => "Euro",
          "rate" => Number.Delimit.number_to_delimited(rate_float),
          "rate_float" => rate_float
        }
      })

    Map.put(data, "bpi", bpi)
  end

  defp insert_rate(data, :cad) do
    usd_rate = Decimal.from_float(data["bpi"]["USD"]["rate_float"])
    rate_float = BitcoinCalculator.calculate(usd_rate, :cad)

    bpi =
      Map.merge(data["bpi"], %{
        "CAD" => %{
          "code" => "CAD",
          "description" => "Canadian Dollar",
          "rate" => Number.Delimit.number_to_delimited(rate_float),
          "rate_float" => rate_float
        }
      })

    Map.put(data, "bpi", bpi)
  end
end
