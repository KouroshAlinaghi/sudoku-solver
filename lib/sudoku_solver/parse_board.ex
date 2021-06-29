defmodule SudokuSolver.ParseBoard do
  @moduledoc """
    Parses board from a given file with the following format:
  
    9 lines, each line only should have these characters:
      1 - one-digit number
      2 - * (empty homes)
      3 - space (for seperating homes)
  """

  def parse(path) do
    case File.read(path) do
      {:ok, body} ->
        body
        |> String.split("\n", parts: 9)
        |> Enum.map(fn line -> 
          line
          |> String.trim
          |> String.split(" ")
          |> Enum.map(fn char -> 
            if char == "*" do
              nil
            else
              {num, ""} = Integer.parse(char)
              num
            end
          end)
        end)

      {:error, :enoent} -> IO.inspect "No such file: #{path}"
    end
  end
end
