defmodule JessicaBoss.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table "users" do
      add :first_name, :string
      add :last_name, :string
      add :rfid, :string
      add :deleted_at, :utc_datetime

      timestamps()
    end
  end
end
