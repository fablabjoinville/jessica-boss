defmodule JessicaBossWeb.AppController do
  use JessicaBossWeb, :controller

  alias JessicaBossWeb.UserModel

  def rfids(conn, params) do
    users = UserModel.all([:rfid, :deleted_at])
    json conn, %{users: users}
  end
end
