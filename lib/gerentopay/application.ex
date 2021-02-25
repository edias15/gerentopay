defmodule Gerentopay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gerentopay.Repo,
      # Start the Telemetry supervisor
      GerentopayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gerentopay.PubSub},
      # Start the Endpoint (http/https)
      GerentopayWeb.Endpoint
      # Start a worker by calling: Gerentopay.Worker.start_link(arg)
      # {Gerentopay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gerentopay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GerentopayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
