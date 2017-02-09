# maxercises
This is an ad-hoc created package for simplifying the process of creating exercise/solution sheets and exams. The creation of problems/solutions is similar to `enumerate`, but is based on the more primitive `list` type, which avoids interference with the normal `enumerate` behaviour.

The intention is to keep it small, but not minimal. It imports a handful of other packages which the author considers a reasonable starting point.

There is no promise of backward compability, so store a copy of the `.sty` file with each project.

## Usage

### Options
The default options are `problemsON` and `solutionsON`.
* `exam` changes headers and renames "Exercises" to "Problems".
* `problemsOFF` hides the problems; `problemsON` shows them.
* `solutionsOFF` hides the solutions; `solutionsON` shows them.

### Environments
This package provides two environments: `problem` and `solution`. These enviroments typeset the problems/exercises and solutions automatically. Subproblems are typeset with the command `\subproblem` (also in the `solution` environment). This works similarly to the enumerate enviroment. To add more general information between two subproblems, the command `\exitsubproblems` can be used.

Example:
```
\begin{problem}
    Main problem setup.
    \subproblem First subproblem.

	With a second paragraph.
    
    \exitsubproblems
    Additional general details.

    \subproblem Second subproblem
\end{problem}
```
Gives
```
Exercise 1.1  Main problem setup.
  (a) First subproblem.
        With a second paragraph.
Additional general details.
  (b) Second subproblem.
```

### Commands
* `\createtitle` creates a title and header/footer based on the information provided by the commands below.

Setting iformation:
* `\setcoursename{value}` sets the name of the course.
* `\setcourseiteration{value}` sets the current iteration of the course (e.g., Spring 2017).
* `\setlecturer{value}` sets the name of the professor/lecturer of the course.
* `\setassistant{value}` sets the name of the main teaching assistant.
* `\setinstitution{value}` sets the name of the university/institution.
* `\setsheetnumber{value}` sets the ordinal number of the exercise sheet. This is ignored if the `exam` option is set.
* `\setlastupdated{value}` sets the last time the document was updated.

Accessing information:
* `\coursename` prints the name of the course.
* `\courseiteration` prints the current iteration of the course (e.g., Spring 2017).
* `\lecturer` prints the name of the professor/lecturer of the course.
* `\assistant` prints the name of the main teaching assistant.
* `\institution` prints the name of the university/institution.
* `\sheetnumber` prints the ordinal number of the exercise sheet.
* `\lastupdated` prints the last time the document was updated.

Manipulating the display of problems/solutions
* `\turnONproblems` shows problems from this point on, regardless of package options.
* `\turnOFFproblems` hides problems from this point on, regardless of package options.
* `\turnONsolutions` shows solutions from this point on, regardless of package options.
* `\turnOFFsolutions` hides solutions from this point on, regardless of package options.

Page breaks
* `\newpageifnoproblems` inserts `\newpage` if problems are hidden.
* `\newpageifnosolutions` inserts `\newpage` if solutions  are hidden.
* `\skipnewpage` skips the insertion of a new page when a problem follows a solution.

Convenience commands
* `\remark` inserts a typeset "Remark:" text.
* `\note` inserts a typeset "Note:" text.
* `\hint` inserts a typeset "Hint:" text.

### Additional information
The headers/footers are set using `fancyhdr` and can be customized using the corresponding syntax.
