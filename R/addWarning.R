#' @rdname newArgCheck
#' @export addWarning
#'

addWarning <- function(expr, msg, argcheck)
{
  if (!is.logical(expr)) stop("'expr' must be a logical expression")
  if (!"ArgCheck" %in% class(argcheck))
    stop("'argcheck' must be an object of class 'ArgCheck'")
  
  if (class(argcheck)[2] == "list")
  {
    if (expr){
      argcheck$n_warn <- argcheck$n_warn + 1
      argcheck$warn_msg <- c(argcheck$warn_msg, msg)
      return(argcheck)
    }
  }
  else{ 
    if (expr){
      assign("n_warn", 
             get("n_warn", envir = argcheck) + 1, 
             envir = argcheck)
      assign("warn_msg", 
             c(get("warn_msg", envir = argcheck),
               msg), 
             envir = argcheck)
    }
  }
}
