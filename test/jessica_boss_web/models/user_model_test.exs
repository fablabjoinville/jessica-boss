defmodule JessicaBossWeb.UserModelTest do
  use ExUnit.Case

  import Ecto.Query

  alias JessicaBossWeb.UserModel
  alias JessicaBoss.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "insert/1" do
    test "inserts valid user" do
      UserModel.insert!(%{first_name: "Thiago", last_name: "Strutz", rfid: "Thiago-Strutz-rfid"})

      query = from u in UserModel.Schema,
                where: u.first_name == "Thiago",
                  select: u
      user = Repo.one(query)

      assert user.first_name == "Thiago"
      assert user.last_name == "Strutz"
      assert user.rfid == "Thiago-Strutz-rfid"
    end

    test "does not insert invalid user" do
      assert_raise Ecto.InvalidChangesetError, fn ->
        UserModel.insert!(%{first_name: "Thiago", last_name: "Strutz"})
      end
    end
  end

  describe "all/1" do
    setup do
      jennifer = UserModel.insert!(%{
        first_name: "Jennifer",
        last_name: "Trentini",
        rfid: "Jennifer-Trentini-rfid"
      })
      jessica = UserModel.insert!(%{
        first_name: "Jessica",
        last_name: "Strutz",
        rfid: "Jessica-Strutz-rfid",
        deleted_at: DateTime.utc_now()
      })
      {:ok, users: %{jessica: jessica, jennifer: jennifer}}
    end

    test "returns array with params fields", context do
      fields = [:rfid, :deleted_at]

      users = UserModel.all(fields)

      assert Enum.member?(users, %{
          rfid: context[:users][:jennifer].rfid,
          deleted_at: context[:users][:jennifer].deleted_at
      })
      assert Enum.member?(users, %{
          rfid: context[:users][:jessica].rfid,
          deleted_at: context[:users][:jessica].deleted_at
      })
    end

    test "return array with no params fields", context do
      users = UserModel.all()

      assert Enum.member?(users, %{
        first_name: context[:users][:jennifer].first_name,
        last_name: context[:users][:jennifer].last_name,
        rfid: context[:users][:jennifer].rfid,
        deleted_at: context[:users][:jennifer].deleted_at
      })
      assert Enum.member?(users, %{
        first_name: context[:users][:jessica].first_name,
        last_name: context[:users][:jessica].last_name,
        rfid: context[:users][:jessica].rfid,
        deleted_at: context[:users][:jessica].deleted_at
      })
    end
  end
end
