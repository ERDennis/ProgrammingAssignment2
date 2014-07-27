## Both functions will take a saved matrix and invert it. The
## first function will cache the inverse matrix, while the
## second one will generate it.

## The function makeCacheMatrix takes a matrix and sets the inverse of
## the matrix into the cache.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setInverse <- function(inverse) m <<- inverse
	getInverse <- function() m
	list(set = set, get = get,
		setInverse = setInverse,
		getInverse = getInverse)
}


## cacheSolve takes the inverse of the matrix retrieved from above, tests
## it by checking if m is null, then returning the inverse of the matrix.
cacheSolve <- function(x, ...) {
	m <- x$getInverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data)
	x$setInverse()
	m
        ## Return a matrix that is the inverse of 'x'
}
