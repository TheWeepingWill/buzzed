defmodule BuzzedWeb.BuzzerLive.FormComponent do
  use BuzzedWeb, :live_component

  alias Buzzed.Games

  @impl true
  def update(%{buzzer: buzzer} = assigns, socket) do
    changeset = Games.change_buzzer(buzzer)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"buzzer" => buzzer_params}, socket) do
    changeset =
      socket.assigns.buzzer
      |> Games.change_buzzer(buzzer_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"buzzer" => buzzer_params}, socket) do
    save_buzzer(socket, socket.assigns.action, buzzer_params)
  end

  defp save_buzzer(socket, :edit, buzzer_params) do
    case Games.update_buzzer(socket.assigns.buzzer, buzzer_params) do
      {:ok, _buzzer} ->
        {:noreply,
         socket
         |> put_flash(:info, "Buzzer updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_buzzer(socket, :new, buzzer_params) do
    params = Map.put(buzzer_params, "creator_id", socket.assigns.creator_id)

    case Games.create_buzzer(params) do
      {:ok, _buzzer} ->
        {:noreply,
         socket
         |> put_flash(:info, "Buzzer created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
