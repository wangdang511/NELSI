As of March 24 2014 this needs to be updated. Add tutorial and fix readme file

This is the home of NELSI: Nucleotide Evolutionary rate Simulator

This is the list of potential functions:

- Added a function to read beast trees directly and plot them as a ratesim object. Note that in this case we have the chronogram and not the phylogram. plot.beast.tree and read.beast.tree need to be added to the R and man folders.

- simulate.rate
  - ~~strict clock~~
  - ~~uncorrelated lognormal~~
  - ~~uncorrelated exponential~~
  - ~~uncorrelated gamma~~
  - ~~autocorrelated Kishino (2001)~~
  - ~~autocorrelated Thorne (1998)~~
  - ~~White noise~~
  - ~~Time dependent exponential decay~~
  - ~~Time dependent with custom function~~

- ~~get.tree.data.matrix~~

- ~~get.rate.descendant.pairs~~

- ~~allnode.times (if used for substitutions and time, then it can be used for linear regression to test for clocklike behaviour as in path-o-gen)~~

- ~~mid.ages~~

- ~~pathnode with modifications ( for Node density effect)~~

- ~~plot rates trough time along lineages~~

- ~~plot root to tip distance with a chronogram and a phylogram~~


The dependencies are:

- APE

- GEIGER

- PHANGORN


