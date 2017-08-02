defmodule BitcoinReg.Router do
  use BitcoinReg.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BitcoinReg do
    pipe_through :api
  end
end
