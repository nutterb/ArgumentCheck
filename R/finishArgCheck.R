#' @rdname newArgCheck
#' @export finishArgCheck
#'

finishArgCheck <- function(argcheck){
  fn_call <- sys.call(-1)
  fn_call <- capture.output(fn_call)

  if (!"ArgCheck" %in% class(argcheck))
    stop("'argcheck' must be an object of class 'ArgCheck'")

  if (argcheck$n_warn > 0)
    warning(paste0(c("", fn_call,
                   paste0(1:argcheck$n_warn, ": ", argcheck$warn_msg)), collapse="\n"),
            call.=FALSE)

  if (argcheck$n_error > 0)
    stop(paste0(c("", fn_call,
                paste0(1:argcheck$n_error, ": ", argcheck$error_msg)), collapse="\n"),
         call.=FALSE)
}
