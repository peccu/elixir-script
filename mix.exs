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
      deps: deps(),
      build_path: build_path(),
      deps_path: deps_path(),
      lockfile: lockfile_path()
    ]
  end

  defp mix_dir do
    # https://github.com/elixir-lang/elixir/blob/v1.9.1/lib/mix/lib/mix/cli.ex#L37
    (System.get_env("MIX_EXS") || "mix.exs")
    |> Path.dirname
    |> Path.expand
  end

  # https://hexdocs.pm/mix/Mix.Project.html#build_path/1
  defp build_path do
    mix_dir()
    |> Kernel.<>("/_build")
  end

  # https://hexdocs.pm/mix/Mix.Project.html#deps_path/1
  defp deps_path do
    mix_dir()
    |> Kernel.<>("/deps")
  end

  # https://elixir-lang.org/getting-started/mix-otp/dependencies-and-umbrella-projects.html#umbrella-projects
  defp lockfile_path do
    mix_dir()
    |> Kernel.<>("/mix.lock")
  end

  # mix deps.get && mix deps.compile
  # mix run main.exs
  defp deps do
     [
     ]
  end
end
