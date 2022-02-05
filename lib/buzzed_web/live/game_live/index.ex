defmodule BuzzedWeb.GameLive.Index do
  use BuzzedWeb, :live_view

  alias Buzzed.Games
  alias Buzzed.Games.Game
  alias Buzzed.Accounts

  @impl true
  def mount(_params, %{"user_token" => token}, socket) do
    {:ok,
     socket
     |> assign(:games, list_games())
     |> assign(:current_user, Accounts.get_user_by_session_token(token))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    IO.inspect("!!!!!!!!!!!!!!!!!!!!")
    IO.inspect(id)
    socket
    |> assign(:page_title, "Edit Game")
    |> assign(:game, Games.get_game!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Game")
    |> assign(:game, %Game{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Games")
    |> assign(:game, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    game = Games.get_game!(id)
    {:ok, _} = Games.delete_game(game)

    {:noreply, assign(socket, :games, list_games())}
  end

  defp list_games do
    Games.list_games()
  end
end
