defmodule JessicaBossWeb.AppController do
  use JessicaBossWeb, :controller

  def rfids(conn) do
    conn |> send_resp(200, "TODO")
  end
end
