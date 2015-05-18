## R Programming Assignment Number 2
## Jim Christensen, May 17, 2015

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
  
  setMatrix <- function(y) {            ## this function wil save the input matrix in the
    x <<- y                             ## parent environment
    im <<- NULL
  }
  getMatrix <- function() {             ## this function will return the input matrix
    x
  }
  setInverse <- function(inverse) {     ## this function will cache the inverted matrix in the
    im <<- inverse                      ## parent environment
  }
  getInverse <- function() {            ## this function will return the cached inverted matrix
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
  im <- solve(matrix)                                     ## solve (invert) the input matrix
  message("solving for the inverse of the matrix")
  x$setInverse(im)                                        ## then cache the result for later
  im
    
}

go <- function()  {                                       ## create a function to test the code
  
  mymat <- matrix(c(2,5,3,7,3,8,4,7,2),3,3)               ## create a test matrix
  
  mm <- makeCacheMatrix(mymat)
  
  print(cacheSolve(mm))                   ## the first time cacheSolve is called, the inverse is computed
  print(cacheSolve(mm))                   ## the second and third time, the inverse is recalled from cache
  print(cacheSolve(mm))
  
}

go2 <- function()  {                                      ## create a function to test the code
  
  mm <- makeCacheMatrix()                                 ## create the special matrix (function list)
  
  mymat <- matrix(c(2,5,3,7,3,8,4,7,2),3,3)               ## create a test matrix
  
  mm$setMatrix(mymat)                     ## set the value of the input matrix
  xx <- mm$getMatrix()                    ## retrieve the input matrix
  message("Input matrix")
  print(xx)                               ## check the return value of the matrix
  
  print(cacheSolve(mm))                   ## the first time cacheSolve is called, the inverse is computed
  print(cacheSolve(mm))                   ## the second and third time, the inverse is recalled from cache
  print(cacheSolve(mm))
  
}