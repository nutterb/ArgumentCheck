#' @title Improved Argument Check Communication
#'
#' @description The typical process of checking arguments in functions is iterative.  In
#' this process, an error may be returned and the user may fix it only to receive
#' another error on a different argument.  'ArgumentCheck 'facilitates a more helpful
#' way to perform argument checks allowing the programmer to run all of the checks
#' and then return all of the errors and warnings in a single message.
#'
#' @examples
#' \dontrun{
#' #* This example is taken from the discussion of argument checking at
#' #* http://www.r-bloggers.com/programming-with-r---checking-function-arguments/
#' cylinder.volume <- function(height, radius){
#'   ArgCheck <- newParamCheck()
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
#' finishParamCheck(ArgCheck)
#'
#' volume <- pi * radius^2 * height
#' volume
#' }
#'
#' #' cylinder.volume()
#' cylinder.volume(height = -3)
#' cylinder.volume(height = 3, radius = -2)
#' cylinder.volume(height = 3, radius=2)
#' cylinder.volume(height = -8, radius = 4)
#' }
#'
#' @name ArgumentCheck
#' @docType package
#'

NULL
