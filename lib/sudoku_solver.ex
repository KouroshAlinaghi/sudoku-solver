defmodule SudokuSolver do

  import SudokuSolver.{BoardHelpers, ParseBoard}

  @moduledoc """
  Solve algorithm for sudoku puzzle.
  """

  def solve(path) do
    board = parse(path)
    empties = get_empties(board, 0, 0, [])
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
  

  def do_solve(_board, 10, 0, _empties), do: IO.inspect "This puzzle has no solutions"
  def do_solve(board, 10, i, empties) do
    {x, y} = Enum.at(empties, i)
    {px, py} = Enum.at(empties, i-1)
    old_value = get_value(board, px, py)
    new_board = put(board, x, y, nil)
    do_solve(new_board, old_value+1, i-1, empties)
  end
  def do_solve(board, number, i, empties) do
    {x, y} = Enum.at(empties, i)
    new_board = put(board, x, y, number)
    if validate_board(new_board) do
      if i == length(empties)-1 do
        new_board
      else
        do_solve(new_board, 1, i+1, empties)
      end
    else
      do_solve(new_board, number+1, i, empties)
    end
  end
end

SudokuSolver.solve("lib/sudoku_solver/board_file.txt")
