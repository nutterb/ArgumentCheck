#' @rdname newArgCheck
#' @export addMessage
#'

addMessage <- function(expr, msg, argcheck){
  if (!is.logical(expr)) stop("'expr' must be a logical expression")
  if (!"ArgCheck" %in% class(argcheck))
    stop("'argcheck' must be an object of class 'ArgCheck'")

  if (expr) {
#     argcheck$n_warn <- argcheck$n_warn + 1
#     argcheck$warn_msg <- c(argcheck$warn_msg, msg)
    assign("n_message", 
           get("n_message", envir = argcheck) + 1, 
           envir = argcheck)
    assign("message_msg", 
           c(get("message_msg", envir = argcheck),
             msg), 
           envir = argcheck)
  }
}
