defmodule SudokuSolver.CLI do
  def main(args) do
    t1 = System.os_time(:millisecond)
    case args
          |> parse_args()
          |> SudokuSolver.solve() do
      {:ok, board} -> 
        t2 = System.os_time(:millisecond)
        SudokuSolver.Helpers.draw(board)
        IO.inspect "SOLVED in #{t2 - t1} milliseconds"
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
