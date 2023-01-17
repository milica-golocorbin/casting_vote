defmodule CastingVote.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CastingVote.Repo,
      # Start the Telemetry supervisor
      CastingVoteWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CastingVote.PubSub},
      # Start the Endpoint (http/https)
      CastingVoteWeb.Endpoint
      # Start a worker by calling: CastingVote.Worker.start_link(arg)
      # {CastingVote.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CastingVote.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CastingVoteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
