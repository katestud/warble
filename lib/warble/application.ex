defmodule Warble.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Warble.Repo,
      # Start the Telemetry supervisor
      WarbleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Warble.PubSub},
      # Start the Endpoint (http/https)
      WarbleWeb.Endpoint
      # Start a worker by calling: Warble.Worker.start_link(arg)
      # {Warble.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Warble.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WarbleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
