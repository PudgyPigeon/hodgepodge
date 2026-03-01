# Gateway to postgres

defmodule Hodgepodge.Repo do
  use Ecto.Repo,
    otp_app: :hodgepodge,
    adapter: Ecto.Adapters.Postgres
end
