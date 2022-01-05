defmodule Buzzed.Repo do
  use Ecto.Repo,
    otp_app: :buzzed,
    adapter: Ecto.Adapters.Postgres
end
