.onLoad <- function(libname,pkgname)
{
  packageStartupMessage(paste0("In a future version of 'ArgumentCheck', default setting of the ",
                               "'list' argument in 'newArgCheck' will be changed from TRUE to ",
                               "FALSE. Please consider hard coding this argument in your ",
                               "existing code"))
}