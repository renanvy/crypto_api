defmodule CryptoApiWeb.Api.V1.SessionView do
  use CryptoApiWeb, :view

  def render("create.json", %{token: token}) do
    %{token: token}
  end

  def render("invalid_login.json", _) do
    %{message: "Campos inválidos"}
  end
end
