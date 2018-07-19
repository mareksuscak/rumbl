defmodule RumblWeb.WatchController do
  use Rumbl.Web, :controller
  alias RumblWeb.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end
