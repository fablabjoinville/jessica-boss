defmodule JessicaBossWeb.UserModel do
  import Ecto.Changeset
  import Ecto.Query

  alias JessicaBoss.Repo

  defmodule Schema do
    use Ecto.Schema

    schema "users" do
      field :first_name
      field :last_name
      field :rfid
      field :deleted_at, :utc_datetime

      timestamps()
    end
  end

  def all do
    query = from u in Schema,
              select: map(u, [:first_name, :last_name, :rfid, :deleted_at])
    Repo.all(query)
  end

  def all(fields) do
    query = from u in Schema,
              select: map(u, ^fields)
    Repo.all(query)
  end

  def insert!(params) do
    params |> changeset |> Repo.insert!
  end

  def changeset(params \\ %{}) do
    %Schema{}
      |> cast(params, [:first_name, :last_name, :rfid, :deleted_at])
      |> validate_required([:first_name, :last_name, :rfid])
  end
end
