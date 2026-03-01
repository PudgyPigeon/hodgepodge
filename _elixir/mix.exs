defmodule Hodgepodge.MixProject do
  use Mix.Project

  def project do
    [
      app: :hodgepodge,
      version: "0.0.1",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Hodgepodge.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.10"},
      {:postgrex, ">= 0.0.0"},
      {:bandit, "~> 1.0"}, # The Web Server
      {:plug, "~> 1.14"},   # The Router logic
      {:jason, "~> 1.4"}    # JSON parser
    ]
  end
end
