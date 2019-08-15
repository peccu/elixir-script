defmodule Main.Parser do
  def parse(file) do
    stream = File.stream!(file)
    |> Enum.map(&String.trim_trailing/1)
    stream
  end

  def head(stream) do
    stream
    |> Enum.take(1)
  end

  def tail(stream) do
    stream
    |> Enum.slice(1..-1)
  end
end

defmodule Main.Renderer do
  def render(records) do
    [
      header(),
      records |> Enum.map(&escape/1) |> Enum.join("\n"),
      footer()
    ]
    |> Enum.join("\n")
  end

  def header do
    """
    header
    ------
    """
  end

  def footer do
    """
    ------
    footer
    """
  end

  def escape(value) do
    value
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&apos;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("&", "&amp;")
  end

end

defmodule Main do
  def start(file_name) do
    file_name
    |> Main.Parser.parse
    |> Main.Renderer.render
    |> IO.puts
  end
end

defmodule Main.CLI do

  def main(argv) do
    argv
    |> parse_args
    |> run
  end

  defp parse_args(args) do
    parsed_args = OptionParser.parse(
      args,
      switches: [help: :boolean],
      aliases: [h: :help]
    )
    case parsed_args do
      {[help: true], _, _} -> :help
      # if arguments are required
      {_, [], _} -> :help
      {_, file_name, _} -> {:start, file_name}
      _ -> :help
    end
  end

  defp run(:help) do
    IO.puts """
    This is Elixir script
    """
  end

  defp run({:start, [file_name]}) do
    Main.start(file_name)
  end
end

System.argv()
|> Main.CLI.main
