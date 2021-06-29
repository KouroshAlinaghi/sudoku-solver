defmodule SudokuSolver do

  import SudokuSolver.{Helpers, ParseBoard, Validators}

  @moduledoc """
  Solve algorithm for sudoku puzzle.
  """

  def solve(path) do
    board = parse(path)
    empties = get_empties(board, {0, 0}, [])
    do_solve(board, 1, 0, empties)
  end

  # (x, y):
  #
  # [
  #   [(0,0), (1,0), (2,0), ...., (8,0)],
  #   [(0,1), (1,1), (2,1), ...., (8,1)],
  #   [(0,2), (1,3), (2,2), ...., (8,2)],
  #   ...
  #   
  #   [(0,8), (1,8), (2,8), ...., (8,8)]
  # ]

  def do_solve(_table, 10, 0, _empties), do: {:error, "The puzzle has no solutions"}
  def do_solve(table, 10, i, empties) do
    current_home = Enum.at(empties, i)
    previous_home = Enum.at(empties, i-1)
    previous_home_value = get_value(table, previous_home)
    do_solve(put(table, current_home, nil), previous_home_value+1, i-1, empties)
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
