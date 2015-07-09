#' @rdname newArgCheck
#' @export addError
#'

addError <- function(expr, msg, argcheck)
{
  if (!is.logical(expr)) stop("'expr' must be a logical expression")
  if (!"ArgCheck" %in% class(argcheck))
    stop("'argcheck' must be an object of class 'ArgCheck'")
  
  if (class(argcheck)[2] == "list")
  {
    if (expr){
      argcheck$n_error <- argcheck$n_error + 1
      argcheck$error_msg <- c(argcheck$error_msg, msg)
      return(argcheck)
    }
  }
  else{ 
    if (expr){
      assign("n_error", 
             get("n_error", envir = argcheck) + 1, 
             envir = argcheck)
      assign("error_msg", 
             c(get("error_msg", envir = argcheck),
               msg), 
             envir = argcheck)
    }
  }
}

