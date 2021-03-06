## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a special "matrix"

makeCacheMatrix <- function(x = matrix()) {

 		i <- NULL
        	set <- function(y) {
                x <<- y
               i <<- NULL
       	 }
        	get <- function() x
        	setinv <- function(solve) i <<- solve
        	getinv <- function() i
        	list(set = set, get = get,
             	setinv = setinv,
             	getinv = getinv)
	
}

## cacheSolve calculates the inverse of the special "matrix" created 
## with the above function

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinv(i)
        i		## Return a matrix that is the inverse of 'x'
}
