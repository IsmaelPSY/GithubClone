defmodule GithubClone.Gists.SavedGist do
  alias GithubClone.Gists
  alias GithubClone.Accounts
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_gists" do
    belongs_to :user, Accounts.User
    belongs_to :gist, Gists.Gist

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_gist, attrs) do
    saved_gist
    |> cast(attrs, [:user_id, :gist_id])
    |> validate_required([:user_id, :gist_id])
  end
end
