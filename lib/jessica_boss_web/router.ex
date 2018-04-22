defmodule JessicaBossWeb.Router do
  use JessicaBossWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JessicaBossWeb do
    pipe_through :api

    get "/auth_rfid", AppController, :auth_rfid
  end
end
