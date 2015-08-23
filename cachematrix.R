## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function get as input a matrix 
## and creates a special "matrix" object that can cache its inverse
## In fact a list object with 4 elements is created.
## The elements are 4 functions set, get, setinvX, getinvX which do respectively:

## set: set the variable x equal to y and invX equal to NULL (in this case 
## an empty matrix) 

## get: return the matrix 

## setinvX: store the value of the inverse matrix calculated in cacheSolve and passed
## to setinvX through the varible invMatrix

## getinvX: returns the inverse of the matrix (or NULL if the matrix was not yest 
## inverted)


## <<- (superassignment)
## cit "this operator looks back in the eclosing environments for an environment that contain
## the symbol on the left side and when it finds such an environment it replaces 
## the value in that environment with the one on the right side
## get return the to be inverted matrix" (An Introduction to R, pg. 47, W. N. Venables, 
## D. M. Smith and the R Core Team) As specified in the same tutorial, this operator
## has usually the effect to create a global variable
## and assign the value of the right hand side to it

makeCacheMatrix <- function(x = matrix()) {
  invX <- NULL
  set <- function(y){
    x<<-y
    invX <<- NULL
  }
  
  get <- function() x
  setinvX <- function(invMatrix) invX <<- invMatrix 
  getinvX <- function() invX
  list(set=set, get=get, setinvX=setinvX, getinvX = getinvX)
}


## Write a short comment describing this function

## This function computes the inverse of the matrix returned by
## makeCacheMatrix or retrives the cached value in case the inverse has been already
## calculated.
## To be precise, the input of the function is the list created in makeCacheMatrix
## whose elements are accessed with the operator $
## Initially the line invX <- x$getinvX() call the function getinvX()
## if invX is not NULL, this means that the inverse was already calculated and
## cached. Therefore, the cached value is retrieved and a message "getting cached data"
## is printed on the console to notify this fact
## Otherwise, if invX is NULL (e.g. the inverse of the matrix was not calculated yet),
## the value of the matrix is get: x$get()
## the inverse is calculated: invX <- solve(myMatrix, ...)
## and cached: x$setinvX(invX)
## finally the inverse matrix is printed to the console: invX


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invX <- x$getinvX()
  if (! is.null(invX)){
    message("getting cached data")
    return(invX)
  }
  
  myMatrix <- x$get()
  invX <- solve(myMatrix, ...)
  x$setinvX(invX)
  invX
}
