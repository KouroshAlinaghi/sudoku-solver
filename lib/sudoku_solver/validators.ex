defmodule SudokuSolver.Validators do

  @moduledoc """
  This module provides functions to validate if putting a number in a home is valid
  """

  import SudokuSolver.Helpers

  @doc """
    Checks if putting a number in (x, y) is valid or not
  """
  def can_place_number_here(table, {x, y}, number) do
    !(table
    |> Enum.at(y)
    |> Enum.any?(fn num -> num == number end)) and
    !(table
    |> Enum.map(&(Enum.at(&1, x)))
    |> Enum.any?(fn num -> num == number end)) and
    !exists_in_square(table, {x, y}, number)
  end

  defp exists_in_square(table, {x, y}, number) do
    n = table
        |> length()
        |> :math.sqrt()
        |> Kernel.trunc()
    sx = (x/n |> Kernel.trunc()) * n
    sy = (y/n |> Kernel.trunc()) * n
    do_loop_on_square(table, {sx, sy}, {sx, sy}, number, n) 
  end

  defp do_loop_on_square(_table, {_x, y}, {_sx, sy}, _number, n) when y == sy+n, do: false
  defp do_loop_on_square(table, {x, y}, {sx, sy}, number, n) when x == sx+n do
    do_loop_on_square(table, {sx, y+1}, {sx, sy}, number, n) 
  end
  defp do_loop_on_square(table, {x, y}, {sx, sy}, number, n) do
    if get_value(table, {x, y}) == number do
      true
    else
      do_loop_on_square(table, {x+1, y}, {sx, sy}, number, n) 
    end
  end
end
