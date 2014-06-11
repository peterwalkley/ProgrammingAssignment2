## Simple pair of functions to compute (and cache) the inverse
## of a matrix.
##
## Demonstration program for Programming in R Coursera course.


# Make a caching matrix.  Example usage:
#
# m <- makeCacheMatrix( )
# m$set( matrix( rnorm(4), 2, 2) )
#
makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set = set, get = get,
		 setinverse = setinverse,
		 getinverse = getinverse)

}


# Calculate the inverse of the matrix previously set.
# This function will cache a computed value for performance
# improvements on multiple invocations.
#
# Example usage:
#
# m_inv <- cacheSolve(m1)
cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
	if(!is.null(inv)) {
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data, ...)
	x$setinverse(inv)
	inv
}
