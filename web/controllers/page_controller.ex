defmodule Tryexpug.PageController do
  use Tryexpug.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
