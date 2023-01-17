defmodule CastingVoteWeb.PageController do
  use CastingVoteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
