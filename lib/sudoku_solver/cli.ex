defmodule SudokuSolver.CLI do
  def main(args) do
    case args
          |> parse_args()
          |> SudokuSolver.solve() do
      {:ok, board} -> SudokuSolver.BoardHelpers.draw(board)
      {:error, reason} -> IO.inspect reason
    end
  end

  defp parse_args(args) do
    {_opts, path, _} =
      args
      |> OptionParser.parse(strict: [])

    path
  end
end
