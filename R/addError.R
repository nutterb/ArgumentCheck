#' @rdname newParamCheck
#' @export addError
#' 

addError <- function(expr, msg, pcheck){
  if (!is.logical(expr)) stop("'expr' must be a logical expression")
  if (!"ParamCheck" %in% class(pcheck))
    stop("'pcheck' must be an object of class 'ParamCheck'")
  
  if (expr){
    pcheck$n_error <- pcheck$n_error + 1
    pcheck$error_msg <- c(pcheck$error_msg, msg)
  }
  return(pcheck)
}
