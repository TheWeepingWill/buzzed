defmodule BuzzedWeb.GamesLive.InitAssigns do
  import Phoenix.LiveView
  alias Buzzed.{Games, Accounts}

  def on_mount(:default, params, session, socket) do
    creator_id = Games.get_game!(Map.get(params, "id")).creator_id
    s = Accounts.get_user_by_session_token(Map.get(session, "user_token")).id

    {:cont,
     socket
     |> assign(:is_creator, s == creator_id)
     |> assign(:current_user, s)}
  end
end
