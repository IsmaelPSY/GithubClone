defmodule GithubClone.Gists.Gist do
  alias GithubClone.Comments
  alias GithubClone.Accounts
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gists" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    belongs_to :user, Accounts.User
    has_many :comments, Comments.Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:user_id, :name, :description, :markup_text])
    |> validate_required([:user_id, :name, :description, :markup_text])
  end
end
