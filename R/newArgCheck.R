#' @name newArgCheck
#' @export newArgCheck
#'
#' @title Argument Checking
#' @description Checking function arguments can be done in a manner that allows
#'   all of the problems in the arguments to be noted and returned to the user
#'   in a single call.  This avoids the potentially iterative process of finding
#'   problems in one argument, fixing the error, and going on to find problems
#'   in subsequent checks.  The \code{ArgCheck} object can store messages
#'   for all of the problems and return these messages all at once, allowing
#'   the user the opportunity to fix all of the arguments before proceeding.
#'
#' @param list A logical indicating if the check results should be stored
#'   in a list or in an environment.
#' @param expr A logical expression that, when \code{TRUE} indicates an error
#'   or warning should be returned.
#' @param msg A Character string giving the message to return with an error or
#'   warning
#' @param argcheck An object with class \code{ArgCheck}, usually created by
#'   \code{newArgCheck}
#'
#' @details
#' \code{newArgCheck} initializes an \code{ArgCheck} object.  This object
#' stores the number of warnings, the number of errors, and the corresponding
#' messages for the warnings and errors.
#'
#' \code{addError} and \code{addWarning} are used to add messages to the
#' \code{ArgCheck} objects.
#'
#' \code{finishArgCheck} looks at the \code{ArgCheck} object.  If it finds
#' any errors or warnings, those are printed for the user to review.  When
#' errors are found, the function is terminated.
#'
#'
#' @author Benjamin Nutter
#' @examples
#' \dontrun{
#' #* This example is taken from the discussion of argument checking at
#' #* http://www.r-bloggers.com/programming-with-r---checking-function-arguments/
#' cylinder.volume <- function(height, radius){
#'   ArgCheck <- newArgCheck()
#'   ArgCheck <- addError(missing(height),
#'                      "A value for 'height' was not provided",
#'                      ArgCheck)
#'   ArgCheck <- addError(ifelse(!missing(height), height < 0, FALSE),
#'                      "'height' must be a non-negative number",
#'                      ArgCheck)
#'   ArgCheck <- addError(missing(radius),
#'                      "A value for 'radius' was not provided",
#'                      ArgCheck)
#'   ArgCheck <- addError(ifelse(!missing(radius), radius < 0, FALSE),
#'                      "'radius' must be a non-negative number",
#'                      ArgCheck)
#'
#'   ArgCheck <- addWarning(ifelse(!missing(height) & !missing(radius),
#'                               height < radius, FALSE),
#'                        "When 'height' < 'radius', you have a short, awkward looking cylinder",
#'                        ArgCheck)
#'
#'   finishArgCheck(ArgCheck, "cylinder.volume")
#'
#'   volume <- pi * radius^2 * height
#'   volume
#' }
#'
#' cylinder.volume()
#' cylinder.volume(height = -3)
#' cylinder.volume(height = 3, radius = -2)
#' cylinder.volume(height = 3, radius=2)
#' cylinder.volume(height = -8, radius = 4)
#' }

newArgCheck <- function(list = TRUE){
  if (list)
  {
    argcheck <- list(n_warn = 0,
                     warn_msg = NULL,
                     n_error = 0,
                     error_msg = NULL,
                     n_message = 0,
                     message_msg = NULL)
    class(argcheck) <- c("ArgCheck", "list")
    return(argcheck)
  }
  else 
  {
    argcheck <- new.env()
    assign("n_warn", 0, envir = argcheck)
    assign("warn_msg", NULL, envir = argcheck)
    assign("n_error", 0, envir = argcheck)
    assign("error_msg", NULL, envir = argcheck)
    assign("n_message", 0, envir = argcheck)
    assign("message_msg", NULL, envir = argcheck)
    class(argcheck) <- c("ArgCheck", "environment")
    return(argcheck)
  }
}

