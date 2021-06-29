defmodule SudokuSolver do

  import SudokuSolver.{Helpers, Validators}

  @moduledoc """
  Solve algorithm for sudoku puzzle.
  """

  def solve(path) do
    table = SudokuSolver.ParseBoard.parse(path)
    empties = get_empties(table, {0, 0}, [])
    do_solve(table, 1, 0, empties)
  end

  # (x, y):
  #
  # [
  #   [(0,0), (1,0), (2,0), ...., (8,0)],
  #   [(0,1), (1,1), (2,1), ...., (8,1)],
  #   [(0,2), (1,2), (2,2), ...., (8,2)],
  #   ...
  #   
  #   [(0,8), (1,8), (2,8), ...., (8,8)]
  # ]

  def do_solve(table, number, 0, _empties) when number == length(table)+1, do: {:error, "The puzzle has no solutions"}
  def do_solve(table, number, i, empties) when number == length(table)+1 do
    do_solve(
      put(table, Enum.at(empties, i), nil),
      get_value(table, Enum.at(empties, i-1)) + 1,
      i-1,
      empties
    )
  end
  def do_solve(table, number, i, empties) do
    current_home = Enum.at(empties, i)
    if can_place_number_here(table, current_home, number) do
      if i == length(empties) - 1 do
        {:ok, put(table, current_home, number)}
      else
        do_solve(put(table, current_home, number), 1, i+1, empties)
      end
    else
      do_solve(table, number+1, i, empties)
    end
  end
end
