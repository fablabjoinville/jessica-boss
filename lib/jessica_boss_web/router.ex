defmodule JessicaBossWeb.Router do
  use JessicaBossWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JessicaBossWeb do
    pipe_through :api

    get "/rfids", AppController, :rsids
  end
end
