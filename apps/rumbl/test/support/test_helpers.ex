defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo

  def insert_user(attrs \\ %{}) do
    changes = attrs |> Enum.into(%{
      name: "Some User",
      username: "user#{random_hash()}",
      password: "supersecret",
    })

    %RumblWeb.User{}
    |> RumblWeb.User.registration_changeset(changes)
    |> Repo.insert!
  end

  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    |> Repo.insert!
  end

  defp random_hash do
    Base.encode16(:crypto.strong_rand_bytes(8))
  end
end
