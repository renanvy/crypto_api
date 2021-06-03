defmodule CryptoApi.Settings do
  alias CryptoApi.Settings.Currency

  def list_currencies do
    "currencies.json"
    |> File.read!()
    |> Jason.decode!()
  end

  def update_currency(params) do
    case Currency.changeset(%Currency{}, params) do
      %Ecto.Changeset{valid?: true} ->
        currencies =
          File.read!("currencies.json")
          |> Jason.decode!()
          |> Map.put(params["currency"], Number.Conversion.to_float(params["value"]))

        File.write("currencies.json", Jason.encode!(currencies))

        {:ok, currencies}

      changeset ->
        {:error, changeset}
    end
  end
end
