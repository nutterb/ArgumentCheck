.onLoad <- function(libname,pkgname)
{
  packageStartupMessage(paste0("ArgumentCheck 0.10.0 is not backward compatible with version ",
                               "0.9.0.\nPlease see the NEWS file or the GitHub page for details."))
}