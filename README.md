# Sudoku Solver
Sovled the given puzzle, using [The “Simple Solving Algorithm”](http://pi.math.cornell.edu/~mec/Summer2009/meerkamp/Site/Solving_any_Sudoku_I.html) in a few seconds. (less than 10 seconds)
## Usage
Call `SudokuSolver.solve/1` with one argument, the board!
```
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


```

The output would look like this:
```
"-------------------------------------"
"| 2 | 9 | 6 | 3 | 1 | 8 | 5 | 4 | 7 |"
"-------------------------------------"
"| 4 | 8 | 5 | 9 | 7 | 2 | 6 | 1 | 3 |"
"-------------------------------------"
"| 7 | 1 | 3 | 6 | 4 | 5 | 2 | 8 | 9 |"
"-------------------------------------"
"| 5 | 2 | 4 | 8 | 9 | 6 | 3 | 7 | 1 |"
"-------------------------------------"
"| 9 | 3 | 1 | 4 | 2 | 7 | 8 | 5 | 6 |"
"-------------------------------------"
"| 6 | 7 | 8 | 5 | 3 | 1 | 9 | 2 | 4 |"
"-------------------------------------"
"| 1 | 6 | 7 | 2 | 5 | 3 | 4 | 9 | 8 |"
"-------------------------------------"
"| 8 | 5 | 9 | 7 | 6 | 4 | 1 | 3 | 2 |"
"-------------------------------------"
"| 3 | 4 | 2 | 1 | 8 | 9 | 7 | 6 | 5 |"
"-------------------------------------"

```
