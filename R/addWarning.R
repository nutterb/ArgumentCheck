#' @rdname newParamCheck
#' @export addWarning
#' 

addWarning <- function(expr, msg, pcheck){
  if (!is.logical(expr)) stop("'expr' must be a logical expression")
  if (!"ParamCheck" %in% class(pcheck))
    stop("'pcheck' must be an object of class 'ParamCheck'")
  
  if (expr) {
    pcheck$n_warn <- pcheck$n_warn + 1
    pcheck$warn_msg <- c(pcheck$warn_msg, msg)
  }  
  return(pcheck)
}
