defmodule GloiresWorld.Repo do
  use Ecto.Repo,
    otp_app: :gloires_world,
    adapter: Ecto.Adapters.Postgres
end
