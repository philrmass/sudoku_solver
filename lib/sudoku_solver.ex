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

  defp load({[], str}) do
    IO.puts "load from #{str}"
  end

  defp load({options, _}) do
    IO.puts "load #{options[:name]} from #{options[:file]}"
  end
end
