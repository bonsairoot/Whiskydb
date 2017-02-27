defmodule Whiskydb.PageController do
  use Whiskydb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
