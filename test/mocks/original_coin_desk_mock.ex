defmodule CryptoApi.Mocks.OriginalCoinDeskMock do
  def get_prices do
    body = %{
      "bpi" => %{
        "BTC" => %{
          "code" => "BTC",
          "description" => "Bitcoin",
          "rate" => "1.0000",
          "rate_float" => 1
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

    {:ok, %HTTPoison.Response{status_code: 200, body: Jason.encode!(body)}}
  end
end
