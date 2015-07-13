# The first function, makeCacheMatrix, creates a special "matrix" object that can cache its inverse. This function creates a 
# list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse of the matrix
# 4. get the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix())
{
  matrix_inverse <- NULL
  set <- function(y)
  {
    x <<- y
    matrix_inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) matrix_inverse <<- inverse
  getinverse <- function () matrix_inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# The following function, cacheSolve, computes the inverse of the special "matrix" returned by makeCacheMatrix aboce. If the inverse has already been
# calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...)
{
  matrix_inverse <- x$getinverse()
  if(!is.null(matrix_inverse))
  {
    message("Getting cached data")
    return(matrix_inverse)
  }
  data <- x$get()
  matrix_inverse <- solve(data)
  x$setinverse(matrix_inverse)
  matrix_inverse
}