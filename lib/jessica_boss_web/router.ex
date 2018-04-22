defmodule JessicaBossWeb.Router do
  use JessicaBossWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JessicaBossWeb do
    pipe_through :api
  end
end
