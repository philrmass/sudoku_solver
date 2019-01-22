# change possibles to MapSet
# puzzle_string :: string
# possibles_string :: string
# add first tests, run them
# same_row(index0, index1) :: boolean
# same_column(index0, index1) :: boolean
# same_box(index0, index1) :: boolean
# same_group(index0, index1) :: boolean
# group_impossibles(index0, index1) :: MapSet
defmodule SudokuSolver do
  def main(args) do
    {:ok, name, puzzle} = args |> parse_args |> load 
    possibles = to_possibles(puzzle)
    IO.puts name
    IO.inspect puzzle
    IO.inspect possibles
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
    values = load_puzzle_values(lines)
    status = if length(values) == 81, do: :ok, else: :error
    {status, name, values}
  end

  def load_puzzle_values(lines) do
    lines
    |> Enum.join("")
    |> String.split("", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def value_to_possibles(value) do
    if value == 0, do: Enum.to_list(1..9), else: [value]
  end

  def to_possibles(puzzle) do
    Enum.map(puzzle, &value_to_possibles/1)
  end
end
