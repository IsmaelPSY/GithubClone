defmodule GithubClone.Repo do
  use Ecto.Repo,
    otp_app: :github_clone,
    adapter: Ecto.Adapters.Postgres
end
