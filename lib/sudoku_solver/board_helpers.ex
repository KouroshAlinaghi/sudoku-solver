defmodule SudokuSolver.BoardHelpers do

  def check_valid(numbers) do
    without_empties = numbers |> Enum.filter(fn item -> !is_nil(item) end)
    without_empties == Enum.uniq(without_empties)
  end

  def get_value(board, x, y) do
    board
    |> Enum.at(y)
    |> Enum.at(x)
  end

  def check_rows(board) do
    board
    |> Enum.all?(&check_valid/1)
  end

  def check_columns(board) do
    do_loop_on_columns(board, 0)
  end

  def do_loop_on_columns(_board, 9), do: true
  def do_loop_on_columns(board, x) do
    if board
    |> Enum.map(fn row -> Enum.at(row, x) end)
    |> check_valid() do
      do_loop_on_columns(board, x+1)
    else
      false
    end
  end

  def validate_board(board) do
    check_columns(board) and check_rows(board) and check_squares(board)
  end

  def check_squares(board) do
    do_loop_on_squares(board, 0, 0)
  end

  def do_loop_on_squares(board, 9, y), do: do_loop_on_squares(board, 0, y+3)
  def do_loop_on_squares(_board, _x, 9), do: true
  def do_loop_on_squares(board, x, y) do
    square = board
    |> Enum.slice(y, 3)
    |> Enum.map(fn row ->
      row
      |> Enum.slice(x, 3)
    end)
    |> List.flatten()

    if check_valid(square) do
      do_loop_on_squares(board, x+3, y)
    else
      false
    end
  end

  def put(board, x, y, number) do
    board
    |> List.update_at(y, fn row -> 
      List.replace_at(row, x, number)
    end)
  end

  def draw(board) do
    for row <- board do
      IO.inspect String.duplicate("-", 33)
      row
      |> Enum.map(fn num -> 
        if is_nil(num), do: " ", else: num
      end)
      |> Enum.join(" | ")
      |> IO.inspect()
    end
    IO.inspect String.duplicate("-", 33)
  end

  def get_empties(_board, _x, 9, empties), do: empties
  def get_empties(board, 9, y, empties), do: get_empties(board, 0, y+1, empties)
  def get_empties(board, x, y, empties) do
    if get_value(board, x, y) do
      IO.inspect "fd"
      get_empties(board, x+1, y, empties)
    else
      get_empties(board, x+1, y, empties ++ [{x, y}])
    end
  end
end
