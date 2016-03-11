## Test environments
* local Windows install (devel-2015-07-08 r68642)
* x86_64-pc-linux-gnu (64-bit) (on travis-ci), R 3.2.1
* win-builder (devel and release)

## R CMD check results
There were no ERRORS or WARNINGS in any of the checks.

NOTE: on win-builder (devel and release) and travis-ci
No repository set, so cyclic dependency check skipped

This NOTE was not observed on the local install 


## Downstream dependencies
Downstream dependencies are HydeNet, mcParallelDo, and pixiedust.
None are affected by this update.  
The update changes the package startup message to indicate that 
ArgumentCheck is no longer maintained and that I will be 
removing it from CRAN in 2017.  (checkmate does everything I
want now, and does it better)

I am the maintainer on HydeNet and pixiedust, and have begun
migrating my code.  I have notified the maintainer of 
mcParallelDo and already updated his code (though he has not
yet submitted to CRAN).

Many thanks.
