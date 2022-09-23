defmodule OneRepair.Repo do
  use Ecto.Repo,
    otp_app: :one_repair,
    adapter: Ecto.Adapters.Postgres
end
