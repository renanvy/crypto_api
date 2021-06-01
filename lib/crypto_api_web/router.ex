defmodule CryptoApiWeb.Router do
  use CryptoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CryptoApiWeb do
  scope "/api/v1", CryptoApiWeb.V1 do
    pipe_through :api

    post "/login", SessionController, :create
  end

  scope "/api/v1", CryptoApiWeb.V1 do
    pipe_through :api

    get "/crypto/btc", BitcoinPriceController, :index
    put "/crypto/btc", CurrencyController, :update
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CryptoApiWeb.Telemetry
    end
  end
end
