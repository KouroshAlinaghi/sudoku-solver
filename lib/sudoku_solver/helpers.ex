defmodule SudokuSolver.Helpers do

  @doc """
    Gets a value from board
  """
  def get_value(board, {x, y}) do
    board
    |> Enum.at(y)
    |> Enum.at(x)
  end

  @doc """
    Returns a board with number replaced at (x, y)
  """
  def put(board, {x, y}, number) do
    board
    |> List.update_at(y, fn row -> 
      List.replace_at(row, x, number)
    end)
  end

  @doc """
    Prints the given board
  """ 
  def draw(board) do
    for row <- board do
      IO.inspect String.duplicate("-", 37)
      "| #{row
      |> Enum.map(fn num -> 
        if is_nil(num), do: " ", else: num
      end)
      |> Enum.join(" | ")} |"
      |> IO.inspect()
    end
    IO.inspect String.duplicate("-", 37)
  end

  @doc """
    Retunrs a list of empty homes's (x, y), using to iterate through in solve algorithm
  """
  def get_empties(_board, {_x, 9}, empties), do: empties
  def get_empties(board, {9, y}, empties), do: get_empties(board, {0, y+1}, empties)
  def get_empties(board, {x, y}, empties) do
    if get_value(board, {x, y}) do
      get_empties(board, {x+1, y}, empties)
    else
      get_empties(board, {x+1, y}, empties ++ [{x, y}])
    end
  end
end
