## Test environments
* local Windows install (devel-2015-06-02 r68457)
* ubuntu 12.04 (on travis-ci), R 3.2.0
* win-builder (devel and release)

## R CMD check results
No Notes, Warnings, or Errors were detected when running CHECK 
on the local Windows install, nor on the win-builder release install.

I receive the following two notes from the travis-ci check and the 
win-builder devel release:

checking CRAN incoming feasibility ... NOTE
Maintainer: 'Benjamin Nutter <benjamin.nutter@gmail.com>'
New submission

checking package dependencies ... NOTE
No repository set, so cyclic dependency check skipped
  
The first note is expected.
The second note is related to the repository setting.  I have not figured
out how to set the repository in travis-ci or win-builder devel. 
I feel reassured that this shouldn't be an issue since it passes
on my local machine and on win-builder release.

## Downstream dependencies
There are no downstream dependencies for this package
at this time.