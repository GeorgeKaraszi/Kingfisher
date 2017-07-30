defmodule KingfisherWeb.PageController do
  use KingfisherWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
