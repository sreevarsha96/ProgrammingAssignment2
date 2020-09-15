
## I simply set the input x variable as a matrix.
## and then set the solved value s variable as a null.
## then I changed every reference to mean to solve.
##library(MASS) is used to calculate inverse for non squared as well as squared matrix
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL #initializing inverse as NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x #funtion to get the matrix x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## Same here, changed mean to solve and variable m to variable s

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inverse of matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
