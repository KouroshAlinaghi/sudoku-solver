defmodule SudokuSolver do

  import SudokuSolver.BoardHelpers 

  @moduledoc """
  Solve algorithm for sudoku puzzle.
  """

  def solve(board) do
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
        draw(new_board)
      else
        do_solve(new_board, 1, i+1, empties)
      end
    else
      do_solve(new_board, number+1, i, empties)
    end
  end
end

example_board = [
  [nil,nil,6,nil,nil,8,5,nil,nil],
  [nil,nil,nil,nil,7,nil,6,1,3],
  [nil,nil,nil,nil,nil,nil,nil,nil,9],
  [nil,nil,nil,nil,9,nil,nil,nil,1],
  [nil,nil,1,nil,nil,nil,8,nil,nil],
  [nil,nil,nil,5,3,nil,nil,nil,nil],
  [1,nil,7,nil,5,3,nil,nil,nil],
  [nil,5,nil,nil,6,4,nil,nil,nil],
  [3,nil,nil,1,nil,nil,nil,6,nil],
]

SudokuSolver.solve(example_board)

