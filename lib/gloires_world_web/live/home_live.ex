defmodule GloiresWorldWeb.HomeLive do
  use GloiresWorldWeb, :live_view

  alias GloiresWorldWeb.Landing

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, mobile_menu_open: false)}
  end

  @impl true
  def handle_event("toggle-mobile-menu", _, socket) do
    {:noreply, update(socket, :mobile_menu_open, &(!&1))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Landing.navbar mobile_menu_open={@mobile_menu_open} />

    <main>
      <Landing.hero />
      <Landing.portfolio />
      <Landing.about />
      <Landing.services />
      <Landing.testimonials />
      <Landing.contact />
      <Landing.footer />
    </main>
    """
  end
end
