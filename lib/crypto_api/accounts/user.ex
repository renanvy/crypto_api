defmodule CryptoApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CryptoApi.Accounts.User

  embedded_schema do
    field :email, :string
    field :password, :string
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password], message: "é obrigatório")
    |> validate_format(
      :email,
      ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/,
      message: "não é um formato válido."
    )
    |> validate_format(:password, ~r/^[[:digit:]]+$/, message: "deve conter apenas digitos.")
    |> validate_length(:password, is: 6, message: "deve conter 6 caracteres.")
  end
end
