defmodule BuzzedWeb.HomeLive.HomePageLive do
  use BuzzedWeb, :live_view
  @impl true
  def mount(_session, _params, socket) do
    {:ok, socket}
  end

  def button_join(assigns) do
    ~H"""
     <button class="p-4 pl-14 pr-14 transition-colors duration-700 transform bg-green-300 hover:bg-green-500 text-gray-100 text-lg rounded-lg focus:border-4 border-green-500"> Join </button>
    """
  end

  def button_new(assigns) do
    ~H"""
    <button class="p-4 pl-14 pr-14 transition-colors duration-700 transform bg-blue-300 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-blue-300"> New </button>
    """
  end
end