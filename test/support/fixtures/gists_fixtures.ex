defmodule GithubClone.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GithubClone.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    attrs =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })

    user = GithubClone.AccountsFixtures.user_fixture()

    {:ok, gist} =
      user
      |> GithubClone.Gists.create_gist(attrs)

    gist
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    gist = GithubClone.GistsFixtures.gist_fixture()

    {:ok, saved_gist} =
      GithubClone.AccountsFixtures.user_fixture()
      |> GithubClone.Gists.create_saved_gist(Map.put(attrs, :gist_id, gist.id))

    saved_gist
  end
end
