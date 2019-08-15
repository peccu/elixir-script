# https://howdoicomputer.ghost.io/including-a-dependency-in-an-elixir-script/
defmodule Snippet.Mixfile do
  use Mix.Project

  def application do
    [applications: []]
  end

  def project do
    [
      app: :snippet,
      version: "1.0.0",
      deps: deps()
    ]
  end

  # mix deps.get && mix deps.compile
  # mix run my_script.exs
  defp deps do
     [
     ]
  end
end
