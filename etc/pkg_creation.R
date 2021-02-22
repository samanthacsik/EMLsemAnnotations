# referencing this blog post: https://www.hvitfeldt.me/blog/usethis-workflow-for-package-development/
# REMINDER: uses GIT_PAT

library(usethis)
library(devtools)
library(roxygen2)
# library(available)
# library(gitcreds)

usethis::use_devtools()
gitcreds::gitcreds_set()
usethis::git_sitrep()

# create_package("~/Repositories/EMLsemAnnotations")
# use_git()
# use_github()

# to write functions:
# use_r("function_name")
use_r("build_attributeID")

# to write tests
# use_test("function_name")

# to add package dependencies to the DESCRIPTION file
# use_package("dplyr")

# create a vingnette
# use_vignette("How to do this cool analysis")
