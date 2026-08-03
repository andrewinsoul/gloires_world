defmodule GloiresWorldWeb.PageController do
  use GloiresWorldWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
