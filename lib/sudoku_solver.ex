defmodule SudokuSolver do
  def main(args) do
    puzzle = args |> parse_args |> load 
    IO.inspect puzzle
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
    values = load_puzzle_values(lines);
    status = if length(values) == 81, do: :ok, else: :error
    {status, name, List.to_tuple(values)}
  end

  def load_puzzle_values(lines) do
    lines
    |> Enum.join("")
    |> String.split("", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end);
  end
end
