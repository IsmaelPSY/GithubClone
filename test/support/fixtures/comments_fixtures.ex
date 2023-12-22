defmodule GithubClone.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GithubClone.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    gist = GithubClone.GistsFixtures.gist_fixture()

    attrs =
      attrs
      |> Enum.into(%{
        markup_text: "some markup_text",
        gist_id: gist.id
      })

    {:ok, comment} =
      GithubClone.AccountsFixtures.user_fixture()
      |> GithubClone.Comments.create_comment(attrs)

    comment
  end
end
