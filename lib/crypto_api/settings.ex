defmodule CryptoApi.Settings do
  alias CryptoApi.Settings.Currency

  @currency_file_path "currencies-#{Mix.env()}.json"

  def list_currencies do
    @currency_file_path
    |> File.read!()
    |> Jason.decode!()
  end

  def update_currency(params) do
    case Currency.changeset(%Currency{}, params) do
      %Ecto.Changeset{valid?: true} ->
        currencies =
          File.read!(@currency_file_path)
          |> Jason.decode!()
          |> Map.put(params["currency"], Number.Conversion.to_float(params["value"]))

        File.write(@currency_file_path, Jason.encode!(currencies))

        {:ok, currencies}

      changeset ->
        {:error, changeset}
    end
  end
end
