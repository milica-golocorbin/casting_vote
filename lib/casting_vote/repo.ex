defmodule CastingVote.Repo do
  use Ecto.Repo,
    otp_app: :casting_vote,
    adapter: Ecto.Adapters.Postgres
end
