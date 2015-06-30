#' @rdname newArgCheck
#' @export finishArgCheck
#'

finishArgCheck <- function(argcheck){
  fn_call <- sys.call(-1)
  fn_call <- capture.output(fn_call)

  if (!"ArgCheck" %in% class(argcheck))
    stop("'argcheck' must be an object of class 'ArgCheck'")

  if (get("n_warn", envir = argcheck) > 0)
    warning(paste0(c("", fn_call,
                   paste0(1:get("n_warn", envir = argcheck), 
                          ": ", 
                          get("warn_msg", envir = argcheck))), 
                   collapse="\n"),
            call.=FALSE)

  if (get("n_error", envir = argcheck) > 0)
    stop(paste0(c("", fn_call,
                paste0(1:get("n_error", envir = argcheck), 
                       ": ", 
                       get("error_msg", argcheck))), collapse="\n"),
         call.=FALSE)
}
