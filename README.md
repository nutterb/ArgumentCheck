[![Build Status](https://travis-ci.org/nutterb/ArgumentCheck.png?branch=devel-envi)](https://travis-ci.org/nutterb/ArgumentCheck)
![](http://cranlogs.r-pkg.org/badges/grand-total/HydeNet)

ArgumentCheck
==============

Simple Tools for Facilitating Informative Parameter Checks in R Functions.

The typical process of checking arguments in functions is
iterative.  In this process, an error may be returned and the user may fix
it only to receive another error on a different argument.  `ArgumentCheck`
facilitates a more helpful way to perform argument checks allowing the
programmer to run all of the checks and then return all of the errors and
warnings in a single message.
