defmodule BuzzedWeb.GameLive.Play do
  use BuzzedWeb, :live_view

  alias Buzzed.Games

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:game, Games.get_game!(id))}
  end

  defp page_title(:play), do: "Play Game"
  defp page_title(:edit), do: "Edit Game"
end
