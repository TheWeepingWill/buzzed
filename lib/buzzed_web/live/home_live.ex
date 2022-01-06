defmodule BuzzedWeb.HomeLive do 
	use BuzzedWeb, :live_view
  
  def mount(_session, _params, socket) do 
  	{:ok, socket}
  end 

end
