
defmodule JessicaBossWeb.UserModelTest do
  use ExUnit.Case

  import Ecto.Query

  alias JessicaBossWeb.UserModel
  alias JessicaBoss.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "#insert inserts valid user" do
    UserModel.insert!(%{first_name: "Thiago", last_name: "Strutz", rfid: "Thiago-Strutz-rfid"})

    query = from u in UserModel.Schema,
              where: u.first_name == "Thiago",
                select: u
    user = Repo.one(query)

    assert user.first_name == "Thiago"
    assert user.last_name == "Strutz"
    assert user.rfid == "Thiago-Strutz-rfid"
  end

  test "#insert does not insert invalid user" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      UserModel.insert!(%{first_name: "Thiago", last_name: "Strutz"})
    end
  end
end
