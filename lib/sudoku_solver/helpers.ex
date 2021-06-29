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
    size = length(board)
    for row <- board do
      row
      |> Enum.map(fn num -> 
        if is_nil(num), do: " ", else: Integer.to_string(num, size+1)
      end)
      |> Enum.join(" ")
      |> IO.inspect()
    end
  end

  @doc """
    Retunrs a list of empty homes's (x, y), using to iterate through in solve algorithm
  """
  def get_empties(table, {_x, y}, empties) when y == length(table), do: empties
  def get_empties(table, {x, y}, empties) when x == length(table), do: get_empties(table, {0, y+1}, empties)
  def get_empties(table, {x, y}, empties) do
    if get_value(table, {x, y}) do
      get_empties(table, {x+1, y}, empties)
    else
      get_empties(table, {x+1, y}, Enum.concat(empties, [{x, y}]))
    end
  end
end
