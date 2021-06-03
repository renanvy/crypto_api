defmodule CryptoApi.Settings.CurrencyTest do
  use CryptoApi.DataCase, async: true

  alias CryptoApi.Settings.Currency

  describe "changeset/2" do
    test "validates presence of currency" do
      params = %{currency: "", value: 2.5}
      changeset = Currency.changeset(%Currency{}, params)

      assert changeset.errors == [
               currency: {"Não pode ficar em branco.", [validation: :required]}
             ]

      refute changeset.valid?
    end

    test "validates presence of value" do
      params = %{currency: "BRL", value: nil}
      changeset = Currency.changeset(%Currency{}, params)
      assert changeset.errors == [value: {"Não pode ficar em branco.", [validation: :required]}]
      refute changeset.valid?
    end

    test "validates inclusion of currency" do
      params = %{currency: "INVALID", value: 2.4}
      changeset = Currency.changeset(%Currency{}, params)

      assert changeset.errors == [
               currency:
                 {"Moeda inválida!", [{:validation, :inclusion}, {:enum, ["BRL", "CAD", "EUR"]}]}
             ]

      refute changeset.valid?
    end

    test "validates value greater than zero" do
      params = %{currency: "BRL", value: 0}
      changeset = Currency.changeset(%Currency{}, params)

      assert changeset.errors == [
               value:
                 {"Valor inválido!",
                  [{:validation, :number}, {:kind, :greater_than}, {:number, 0}]}
             ]

      refute changeset.valid?
    end
  end
end
