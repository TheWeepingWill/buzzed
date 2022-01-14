defmodule BuzzedWeb.BuzzerLive.Index do
  use BuzzedWeb, :live_view

  alias Buzzed.Games
  alias Buzzed.Games.Buzzer
  alias Buzzed.Accounts

  @impl true
  def mount(_params, %{"user_token" => token}, socket) do
    {:ok,
     socket
     |> assign(:buzzers, list_buzzers())
     |> assign(:current_user, Accounts.get_user_by_session_token(token))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Buzzer")
    |> assign(:buzzer, Games.get_buzzer!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Buzzer")
    |> assign(:buzzer, %Buzzer{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Buzzers")
    |> assign(:buzzer, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    buzzer = Games.get_buzzer!(id)
    {:ok, _} = Games.delete_buzzer(buzzer)

    {:noreply, assign(socket, :buzzers, list_buzzers())}
  end

  defp list_buzzers do
    Games.list_buzzers()
  end
end
