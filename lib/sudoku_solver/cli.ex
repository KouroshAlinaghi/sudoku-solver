defmodule SudokuSolver.CLI do
  def main(args \\ []) do
    args
    |> parse_args()
    |> SudokuSolver.solve()
    |> SudokuSolver.BoardHelpers.draw()
  end

  defp parse_args(args) do
    {_opts, path, _} =
      args
      |> OptionParser.parse(strict: [])

    path
  end
end
