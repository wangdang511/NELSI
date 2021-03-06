\name{get.clock.data}
\alias{get.clock.data}
\title{
get.clock.data
}
\description{
get.clock.data returns a data frame with the root-to-tip distance in units of time and substitutions. These data are useful to test for clock-like behaviour with a OLS regression. The function also prints a plot of substitutions vs. time. The results are similar to those produced in path-o-gen (2009)
}
\usage{
get.clock.data(rate.sim.object, tipsonly = T, ...)
}
\arguments{
  \item{rate.sim.object}{
An object of class ratesim, which is typically obtained with the rate simulation functions (see example).
}
  \item{tipsonly}{
Logical.
root-to-tip regressions are usually conducted for the tips only, but it can also include the internal nodes. If tipsonly == T, the data only include the tips, if tipsonly == F it will include the tips and internal nodes.
}
  \item{\dots}{
Additional arguments passed to plot()
}
}
\details{
None.
}
\value{
A data frame with two colums. If tipsonly == T, the first colum is the time from the root to the tips and the second column is the number of substitutions from the root to the tip. If tipsonly == F, the data frame will also include the root-to-tip distances for the internal nodes.
}
\references{
For a the original method implemented in java see:
Rambaut, A. "Path-O-Gen: temporal signal investigation tool." (2009).
http://tree.bio.ed.ac.uk/software/pathogen/
}
\author{
Sebastian Duchene
}
\note{
This function can also be used to analyse trees from a BEAST analysis.
}


\seealso{
trann2trdat can obtain the tree data matrix from a tree estimated with BEAST
}
\examples{
set.seed(12345)
myTree <- rtree(10) # Note that this tree is not ultrametric.
myTreeTimes <- allnode.times(myTree)


plot(myTree, show.tip.label = FALSE)
tiplabels(round(myTreeTimes[1:10], 2))
nodelabels(round(myTreeTimes[11:19], 2))

# Simulate rates along the tree with the uncorrlated lognormal model with default settings.
rateTree <- simulate.rate(tree = myTree, FUN = simulate.uncor.lnorm)

clockDataTree <- get.clock.data(rateTree, pch = 20, col = "blue")

# Linear regression for substitutions as a function of time

lmRate <- lm(substitutions ~ times, data = clockDataTree)
summary(lmRate)


## The function is currently defined as
function (rate.sim.object, tipsonly = T, ...) 
{
    phylogram <- rate.sim.object$phylogram
    chrono <- rate.sim.object$phylogram
    chrono$edge.length <- rate.sim.object[[2]][, 7]
    times <- allnode.times(chrono, tipsonly)
    substitutions <- allnode.times(phylogram, tipsonly)
    plot(times, substitutions, ...)
    return(data.frame(times, substitutions))
  }
}
\keyword{ molecular-clock }
