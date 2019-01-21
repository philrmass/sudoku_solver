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
    load_lines("", String.split(str, "\\n"))
  end

  defp load({options, _}) do
    lines = File.read!(options[:file]) |> String.split("\n")
    load_lines(options[:name], lines)
  end

  defp load_lines("", lines) do
    [name | lines] = lines
    load_puzzle(name, Enum.take(lines, 9))
  end

  defp load_lines(name, lines) do
    index = Enum.find_index(lines, fn x -> x == name end)
    load_puzzle(name, Enum.slice(lines, index + 1, 9))
  end

  defp load_puzzle(name, lines) do
    IO.puts name
    IO.puts length(lines)
    IO.inspect lines 
    # all = Enum.join(lines, "")
    # alln = String.split(all, "", trim: true)
    # ns = map String.to_integer(all1)
    # {:ok, name, List.to_tuple(alln)}
  end
end
