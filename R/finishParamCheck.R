#' @rdname newParamCheck
#' @export finishParamCheck
#' 

finishParamCheck <- function(pcheck){
  if (!"ParamCheck" %in% class(pcheck))
    stop("'pcheck' must be an object of class 'ParamCheck'")
  
  if (pcheck$n_warn > 0)
    warning(paste0("\n", paste0(1:pcheck$n_warn, ": ", pcheck$warn_msg, collapse="\n")))
  
  if (pcheck$n_error > 0)
    stop(paste0("\n", paste0(1:pcheck$n_error, ": ", pcheck$error_msg, collapse="\n")))
}
