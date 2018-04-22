defmodule JessicaBossWeb.AppController do
  use JessicaBossWeb, :controller

  def auth_rfid(conn) do
    conn |> send_resp(200, "TODO")
  end
end
