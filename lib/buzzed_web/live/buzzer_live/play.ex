defmodule BuzzedWeb.BuzzerLive.Play do
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
     |> assign(:buzzer, Games.get_buzzer!(id))}
  end

  defp page_title(:play), do: "play Buzzer"
  defp page_title(:edit), do: "Edit Buzzer"
end
