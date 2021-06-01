defmodule CryptoApiWeb.Api.V1.BitcoinPriceView do
  use CryptoApiWeb, :view

  def render("index.json", %{data: data}) do
    data
  end
end
