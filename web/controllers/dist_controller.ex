defmodule Whiskydb.DistController do
  use Whiskydb.Web, :controller
  alias Whiskydb.Dist

  def index(conn, _params) do
    dists = Repo.all(Dist)
    render(conn, "index.html", dists: dists)
  end

  def show(conn, %{"id" => name})  do
    dist = Repo.get_by!(Dist, name: name)
    render(conn, "show.html", dist: dist)
  end
end
