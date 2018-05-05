defmodule JessicaBossWeb.AppControllerTest do
  use JessicaBossWeb.ConnCase

  alias JessicaBossWeb.UserModel

  test "rfids/2 with registered RFIDSs and their deleted_at value", %{conn: conn} do
    {:ok, users} = create_users()

    response =
      conn
      |> get(app_path(conn, :rfids))
      |> json_response(200)

    expected = %{
      "users" => [
        %{"rfid" => users[:jennifer].rfid, "deleted_at" => format_datetime(users[:jennifer].deleted_at)},
        %{"rfid" => users[:jessica].rfid, "deleted_at" => format_datetime(users[:jessica].deleted_at)}
      ]
    }

    assert response == expected
  end

  defp create_users do
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
    {:ok, %{jessica: jessica, jennifer: jennifer}}
  end

  defp format_datetime(nil), do: nil
  defp format_datetime(date_time) do
    date_time
     |> DateTime.to_string
     |> String.replace(" ", "T")
  end
end
