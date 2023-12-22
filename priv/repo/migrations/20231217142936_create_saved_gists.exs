defmodule GithubClone.Repo.Migrations.CreateSavedGists do
  use Ecto.Migration

  def up do
    create table(:saved_gists, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)
      add :gist_id, references(:gists, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:saved_gists, [:user_id])
    create index(:saved_gists, [:gist_id])
  end

  def down do
    drop table(:saved_gists)
  end
end
