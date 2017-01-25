defmodule TaskBunny.Mixfile do
  use Mix.Project

  def project do
    [
      app: :task_bunny,
      version: "0.1.0",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      # Docs
      name: "TaskBunny",
      source_url: "https://bitbucket.org/squareenixoid/onlinedev-task-bunny/",
      docs:
        [
          extras:
            [
              "README.md",
            ],
        ],
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      extra_applications: [:logger],
      mod: {TaskBunny, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, "~> 2.0"},
      {:amqp, "~> 0.1.5"},
      {:amqp_client, github: "jbrisbin/amqp_client", override: true, ref: "d50aec00b94f0766a048b4eceaf25ddfdeeb1d86"},
      {:rabbit_common, github: "jbrisbin/rabbit_common", override: true, ref: "80814606ae23cc820c74e443383e192cd69ec030"},
      {:meck, "~> 0.8.2", only: :test},
      {:logger_file_backend, "~> 0.0.9", only: :test},
      {:ex_doc, "~> 0.14", only: :dev},
    ]
  end
end
