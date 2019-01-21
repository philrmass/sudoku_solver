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
    {:ok, pid} = StringIO.open(String.replace(str, "\\n", "\n"))
    load_puzzle("", IO.binstream(pid, :line))
  end

  defp load({options, _}) do
    load_puzzle(options[:name], File.stream!(options[:file]))
  end

  defp load_puzzle("", stream) do
    IO.puts "load_puzzle NO_NAME"
    name = Enum.take(stream, 1)
    #IO.puts "name=#{name}"
    #IO.puts "next=#{Enum.take(stream, 2)}"
    #IO.puts "next=#{Enum.take(stream, 2)}"
    stream |> load_puzzle_line() |> load_puzzle_line
  end

  defp load_puzzle(name, stream) do
    IO.puts "load_puzzle #{name}"
    nam = Enum.take(stream, 1)
    IO.puts "nam=#{nam}"
    #IO.puts "next=#{Enum.take(stream, 2)}"
    #IO.puts "next=#{Enum.take(stream, 2)}"
    #load_puzzle_line(name, stream, [])
    stream |> load_puzzle_line() |> load_puzzle_line
  end

  defp load_puzzle_line(stream) do
    IO.puts Enum.take(stream, 1)
    stream
  end
end
