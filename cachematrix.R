## R Programming Assignment Number 2
## Jim Christensen, May, 2015

## The makeCacheMatrix function makes use of R lexical scoping to cache the inverse of a matrix
## so it does not need to be re-computed if there are no changes to the input matrix.
## This function creates a special "matrix" object (a list of functions) that can cache its inverse.

## the cacheSolve function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix. If the inverse has already been calculated (and the input matrix has not 
## changed), then cacheSolve should retrieve the inverse from the cache.

makeCacheMatrix <- function(x = matrix()) {
                        ## define a list of functions to set and get the input matrix (x)
                        ## and to set and get the inverse of the matrix (im)
  im <- NULL
  setMatrix <- function(y) {
    x <<- y
    im <<- NULL
  }
  getMatrix <- function() {
    x
  }
  setInverse <- function(inverse) {
    im <<- inverse
  }
  getInverse <- function() {
    im
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse)

}


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  im <- x$getInverse()                                    ## retrieve the cached inverted matrix
  if(!is.null(im)) {                                      ## if it's not null, just return it and
    message("getting cached inverted matrix")             ## we're done!
    return(im)
  }
  matrix <- x$getMatrix()                                 ## inverse not computed yet, get the input matrix
  im <- solve(matrix)                                     ## solve (invert) the matrix
  x$setInverse(im)                                        ## then cache the result for later
  im
    
}
