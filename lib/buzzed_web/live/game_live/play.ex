defmodule BuzzedWeb.GameLive.Play do
  use BuzzedWeb, :live_view

  alias Buzzed.Games

  @impl true
  def mount(_params, _session, socket) do
    users = [
      "Kate",
      "William",
      "Faith",
      "Miki",
      "Rich",
      "Ivy"
    ]

    {:ok,
     socket
     |> assign(:users, users)}
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

  def handle_event("clear-buzzes", _data, socket) do
    {:noreply, assign(socket, :users, [])}
  end

  def handle_event("next-buzz", _data, socket) do
    if length(socket.assigns.users) > 1 do
      [_ | users] = socket.assigns.users
      {:noreply, assign(socket, :users, users)}
    else
      {:noreply, assign(socket, :users, [])}
    end
  end

  def handle_event("buzz", _data, socket) do
    {:noreply, assign(socket, :users, socket.assigns.users ++ ["Smith"])}
  end

  def button_clear(assigns) do
    ~H"""
     <button class="bg-gradient-to-r from-[#00ffff] to-blue-500 transition-colors rounded-[8px] px-[15px] py-[4px] text-white">
        Clear
    </button>
    """
  end

  def button_next(assigns) do
    ~H"""
     <button class="bg-gradient-to-r from-[#ffc300] to-[#eb5e28] transition-colors rounded-[8px] px-[15px] py-[4px] text-white">
        Next
    </button> 
    """
  end

  def button_buzz(assigns) do
    ~H"""
      <button>
        <div class="bg-white py-24 flex items-center justify-center">
          <div class="relative">
            <div class="bg-green-900 absolute -bottom-2 w-44  h-44  rounded-full flex items-center justify-center"></div>

            <div class="bg-green-500 w-44  h-44 rounded-full flex items-center  justify-center text-center rotate-0 ">
              <h1 class="text-5xl ">Buzzer</h1>
            </div>
          </div>
        </div>
      </button>
    """
  end
end
