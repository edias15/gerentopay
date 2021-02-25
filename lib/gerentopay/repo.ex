defmodule Gerentopay.Repo do
  use Ecto.Repo,
    otp_app: :gerentopay,
    adapter: Ecto.Adapters.Postgres
end
