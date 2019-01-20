defmodule SudokuSolver do
  def main(args) do
    args |> parse_args |> load 
  end

  defp parse_args(args) do
    {options, str, _} = OptionParser.parse(args,
      strict: [
        file: :string,
        name: :string
      ]
    )
    {options, str}
  end

  defp load({[], [str | _]}) do
    {:ok, pid} = StringIO.open(str)
    load_stream(pid, "")
  end

  defp load({options, _}) do
    case File.open(options[:file], [:read]) do
      {:ok, pid} -> load_stream(pid, options[:name])
      {:error, reason} -> IO.puts "Could not open `#{options[:file]}`: #{reason}"
    end
  end

  defp load_stream(pid, name) do
    IO.write "load_stream `#{name}` from "
    IO.inspect pid 
  end
end
