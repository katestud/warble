defmodule Warble.Repo do
  use Ecto.Repo,
    otp_app: :warble,
    adapter: Ecto.Adapters.Postgres
end
