defmodule Hodgepodge.Application do
  use Application

  # Entrypoint
  @impl true
  def start(_type, _args) do

    children = [
      # Start database
      Hodgepodge.Repo,
      # Start web server
      {Bandit, plug: HodgepodgeWeb.Router, port: 4000}
    ]

    opts = [strategy: :one_for_one, name: Hodgepodge.Supervisor]
    Supervisor.start_link(children, opts)



  end
end
