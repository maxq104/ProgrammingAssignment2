## R Programming Assignment Number 2
## Jim Christensen, May, 2015

## The makeCacheMatrix function makes use of R lexical scoping to cache the inverse of a matrix
## so it does not need to be re-computed if there are no changes to the matrix.
## This function creates a special "matrix" object that can cache its inverse.

## the cacheSolve function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix. If the inverse has already been calculated (and the matrix has not 
## changed), then cacheSolve should retrieve the inverse from the cache.

makeCacheMatrix <- function(x = matrix()) {

}




cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
