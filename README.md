# Sudoku Solver
Sovled the given puzzle, using [The “Simple Solving Algorithm”](http://pi.math.cornell.edu/~mec/Summer2009/meerkamp/Site/Solving_any_Sudoku_I.html) in a few seconds. (less than 10 seconds)
## Usage
You need erlang installed on your system to run the executable.
Create a file with the following format:

9 lines, each line only should have these characters:
  1 - one-digit number
  2 - * (empty homes)
  3 - space (for seperating homes)

An example: 

```
* * 6 * * 8 5 * *
* * * * 7 * 6 1 3
* * * * * * * * 9
* * * * 9 * * * 1
* * 1 * * * 8 * *
* * * 5 3 * * * *
1 * 7 * 5 3 * * *
* 5 * * 6 4 * * *
3 * * 1 * * * 6 *
```

Pass the file to the executable:
`./sudoku_solver path/to/your/file`

The output would look like this (if the puzzle has a solution):

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
