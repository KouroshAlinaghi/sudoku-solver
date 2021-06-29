defmodule SudokuSolver.Validators do

  @moduledoc """
  This module provides functions to validate if putting a number in a home is valid
  """

  import SudokuSolver.Helpers

  @doc """
    Checks if putting a number in (x, y) is valid or not
  """
  def can_place_number_here(table, {x, y}, number) do
    table
    |> Enum.at(y)
    |> Enum.all?(fn num -> num != number end) and
    table
    |> Enum.map(&(Enum.at(&1, x)))
    |> Enum.all?(fn num -> num != number end) and
    !exists_in_square(table, {x, y}, number)
  end

  defp exists_in_square(table, {x, y}, number) do
    sx = (x/3 |> Kernel.trunc()) * 3
    sy = (y/3 |> Kernel.trunc()) * 3
    do_loop_on_square(table, {sx, sy}, {sx, sy}, number) 
  end

  defp do_loop_on_square(_table, {_x, y}, {_sx, sy}, _number) when y == sy+3, do: false
  defp do_loop_on_square(table, {x, y}, {sx, sy}, number) when x == sx+3 do
    do_loop_on_square(table, {sx, y+1}, {sx, sy}, number) 
  end
  defp do_loop_on_square(table, {x, y}, {sx, sy}, number) do
    if get_value(table, {x, y}) == number do
      true
    else
      do_loop_on_square(table, {x+1, y}, {sx, sy}, number) 
    end
  end
end
