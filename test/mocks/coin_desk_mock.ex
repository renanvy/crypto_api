defmodule CryptoApi.Mocks.CoinDeskMock do
  def get_prices do
    prices = %{
      "bpi" => %{
        "BRL" => %{
          "code" => "BRL",
          "description" => "Brazilian Real",
          "rate" => "199,263.83",
          "rate_float" => 199_263.82575
        },
        "BTC" => %{
          "code" => "BTC",
          "description" => "Bitcoin",
          "rate" => "1.0000",
          "rate_float" => 1
        },
        "CAD" => %{
          "code" => "CAD",
          "description" => "Canadian Dollar",
          "rate" => "55,716.49",
          "rate_float" => 55716.4872
        },
        "EUR" => %{
          "code" => "EUR",
          "description" => "Euro",
          "rate" => "35,596.64",
          "rate_float" => 35596.6446
        },
        "USD" => %{
          "code" => "USD",
          "description" => "United States Dollar",
          "rate" => "38,692.0050",
          "rate_float" => 38692.005
        }
      },
      "disclaimer" =>
        "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
      "time" => %{
        "updated" => "Jun 3, 2021 20:10:00 UTC",
        "updatedISO" => "2021-06-03T20:10:00+00:00",
        "updateduk" => "Jun 3, 2021 at 21:10 BST"
      }
    }

    {:ok, prices}
  end
end
