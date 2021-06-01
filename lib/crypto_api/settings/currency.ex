defmodule CryptoApi.Settings.Currency do
  use Ecto.Schema
  import Ecto.Changeset
  alias CryptoApi.Settings.Currency

  @permited_types ~w(BRL CAD EUR)

  embedded_schema do
    field :currency_type, :string
    field :value, :decimal
  end

  @doc false
  def changeset(%Currency{} = currency, attrs) do
    currency
    |> cast(attrs, [:currency_type, :value])
    |> validate_required([:currency_type, :value], message: "Não pode ficar em branco.")
    |> validate_inclusion(:currency_type, @permited_types, message: "Moeda inválida!")
    |> validate_number(:value, greater_than: 0, message: "Valor inválido!")
  end
end
