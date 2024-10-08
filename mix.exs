defmodule PomeloEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :pomelo_ex,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PomeloEx.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:typed_ecto_schema, "~> 0.4.1", runtime: false},
      {:httpoison, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:mox, "~> 1.0", only: :test}
    ]
  end
end
