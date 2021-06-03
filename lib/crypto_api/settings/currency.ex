defmodule CryptoApi.Settings.Currency do
  use Ecto.Schema
  import Ecto.Changeset
  alias CryptoApi.Settings.Currency

  @permited_types ~w(BRL CAD EUR)

  embedded_schema do
    field :currency, :string
    field :value, :decimal
  end

  @doc false
  def changeset(%Currency{} = currency, attrs) do
    currency
    |> cast(attrs, [:currency, :value])
    |> validate_required([:currency, :value], message: "Não pode ficar em branco.")
    |> validate_inclusion(:currency, @permited_types, message: "Moeda inválida!")
    |> validate_number(:value, greater_than: 0, message: "Valor inválido!")
  end
end
