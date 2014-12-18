#' @name newParamCheck
#' @export newParamCheck
#' 
#' @title Parameter Checking
#' @description Checking function arguments can be done in a manner that allows
#'   all of the problems in the arguments to be noted and returned to the user
#'   in a single call.  This avoids the potentially iterative process of finding
#'   problems in one argument, fixing the error, and going on to find problems
#'   in subsequent checks.  The \code{ParamCheck} object can store messages 
#'   for all of the problems and return these messages all at once, allowing 
#'   the user the opportunity to fix all of the arguments before proceeding.
#'  
#' @param expr A logical expression that, when \code{TRUE} indicates an error
#'   or warning should be returned.
#' @param msg A Character string giving the message to return with an error or
#'   warning
#' @param pcheck An object with class \code{ParamCheck}, usually created by 
#'   \code{newParamCheck}
#'   
#' @details
#' \code{newParamCheck} initializes an \code{ParamCheck} object.  This object
#' stores the number of warnings, the number of errors, and the corresponding
#' messages for the warnings and errors.  
#' 
#' \code{addError} and \code{addWarning} are used to add messages to the 
#' \code{ParamCheck} objects.
#' 
#' \code{finishParamCheck} looks at the \code{ParamCheck} object.  If it finds
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
#'   PCheck <- newParamCheck()
#'   PCheck <- addError(missing(height),
#'                      "A value for 'height' was not provided",
#'                      PCheck)
#'   PCheck <- addError(ifelse(!missing(height), height < 0, FALSE),
#'                      "'height' must be a non-negative number",
#'                      PCheck)
#'   PCheck <- addError(missing(radius), 
#'                      "A value for 'radius' was not provided",
#'                      PCheck)
#'   PCheck <- addError(ifelse(!missing(radius), radius < 0, FALSE),
#'                      "'radius' must be a non-negative number",
#'                      PCheck)
#'   
#'   PCheck <- addWarning(ifelse(!missing(height) & !missing(radius),
#'                               height < radius, FALSE),
#'                        "When 'height' < 'radius', you have a short, awkward looking cylinder",
#'                        PCheck)
#'   
#'   finishParamCheck(PCheck)
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
  
newParamCheck <- function(){
  pcheck <- list(n_warn = 0,
                 warn_msg = NULL,
                 n_error = 0,
                 error_msg = NULL)
  class(pcheck) <- c("ParamCheck", "list")
  pcheck
}
