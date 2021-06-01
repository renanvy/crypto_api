defmodule CryptoApi.Accounts do
  @alphabet ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @numbers ~w(0 1 2 3 4 5 6 7 8 9)

  alias CryptoApi.Accounts.User

  def login(params) do
    case User.changeset(%User{}, params) do
      %Ecto.Changeset{valid?: true} ->
        {:ok, generate_token()}

      _ ->
        {:error, :invalid_login}
    end
  end

  defp generate_token do
    list = @alphabet ++ @numbers

    1..16
    |> Enum.reduce([], fn _, acc -> [Enum.random(list) | acc] end)
    |> Enum.join("")
  end
end
