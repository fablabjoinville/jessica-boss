defmodule JessicaBoss.SyncDbTest do
  use ExUnit.Case

  import Mock

  setup context do
    path = Path.join([Path.absname("test"), "remote_db_stub.json"])
    {:ok, file_content} = File.read path
    [stub_db: Poison.decode!(file_content)]
  end

  test "#execute syncs local db with remote one", context do
    with_mock HTTPotion, [get: fn(_url) -> context.stub_db end] do

      assert HTTPotion.get(heroku_url()) == context.stub_db

    end
  end

  defp heroku_url, do: Application.get_env(:jessica_boss, :heroku_url)
end
