defmodule CryptoApi.Accounts.UserTest do
  use CryptoApi.DataCase, async: true

  alias CryptoApi.Accounts.User

  describe "changeset/2" do
    test "validates presence of email" do
      params = %{email: "", password: "123456"}
      changeset = User.changeset(%User{}, params)
      assert changeset.errors == [email: {"é obrigatório", [validation: :required]}]
      refute changeset.valid?
    end

    test "validates presence of password" do
      params = %{email: "renanvy@gmail.com", password: ""}
      changeset = User.changeset(%User{}, params)
      assert changeset.errors == [password: {"é obrigatório", [validation: :required]}]
      refute changeset.valid?
    end

    test "validates format of email" do
      params = %{email: "invalid-email", password: "123456"}
      changeset = User.changeset(%User{}, params)
      assert changeset.errors == [email: {"não é um formato válido.", [validation: :format]}]
      refute changeset.valid?
    end

    test "validates only numbers on password" do
      params = %{email: "renanvy@gmail.com", password: "abc123"}
      changeset = User.changeset(%User{}, params)

      assert changeset.errors == [
               password: {"deve conter apenas digitos.", [validation: :format]}
             ]

      refute changeset.valid?
    end

    test "validates length of password" do
      params = %{email: "renanvy@gmail.com", password: "12345678"}
      changeset = User.changeset(%User{}, params)

      assert changeset.errors == [
               password:
                 {"deve conter 6 caracteres.",
                  [{:count, 6}, {:validation, :length}, {:kind, :is}, {:type, :string}]}
             ]

      refute changeset.valid?
    end
  end
end
