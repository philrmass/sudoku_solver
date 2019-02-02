# Sudoku Solver

### By **Phil Mass**

## Description

_This is an Elixir command line application for solving sudoku puzzles. I created it as a way to better learn the Elixir language_

## Setup and Installation

To build and run the project
* In a terminal, to into the project directory and build with:
```console
mix escript.build
```
To run the project
* In a terminal, go into the project directory and run with:
* the file parameter is the path to the puzzle text file to load
* the name parameter is name of the puzzle to find within the file
```console
./sudoku_solver --file=puzzles.txt --name=second
```
Puzzle file format
* Puzzles are loaded from files with the format shown below (example shows 2 puzzles)
* Each puzzle consists of 10 lines of the file
* The first line of each puzzle is the puzzle's name (it can be blank)
* The next 9 lines are the lines of the puzzle from top to bottom
* The puzzle lines each consist of 9 single digits (0 - 9) with no spaces or other punctuation
* Blank spaces in the puzzle are designated with a value of 0
```text
first
003020600
900305001
001806400
008102900
700000008
006708200
002609500
800203009
005010300
second
200080300
060070084
030500209
000105408
000000000
402706000
301007040
720040060
004010003
```

## Project Plan

- [ ] Add string puzzle option to readme
- [ ] Change possibles to MapSet
- [ ] Add puzzle_string :: string for display
- [ ] Add possibles_string :: string for display
- [ ] Add first tests and get them to pass
- [ ] Add same_row(index0, index1) :: boolean
- [ ] Add same_column(index0, index1) :: boolean
- [ ] Add same_box(index0, index1) :: boolean
- [ ] Add same_group(index0, index1) :: boolean
- [ ] Add group_impossibles(index0, index1) :: MapSet
- [ ] Remove impossibles one step at a time or until all found
- [ ] Add more complex rules to solve harder puzzles
