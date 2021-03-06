% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.tac}
\alias{plot.tac}
\title{Plots time activity curves from 1 or 2 participants or groups.}
\usage{
\method{plot}{tac}(
  x,
  tac2 = NULL,
  ROIs,
  ymax = 25,
  time = "minutes",
  title = "",
  colors = rainbow,
  ...
)
}
\arguments{
\item{x}{A tac object containing time-activity curves to plot, e.g. from 
tac_roi() or load_tac()}

\item{tac2}{An optional, second TAC, to plot for comparison}

\item{ROIs}{A vector of ROIs to plot, names matching the TAC headers}

\item{ymax}{The maximum value on the y-axis}

\item{time}{"seconds" or "minutes" depending on desired x-axis, converts tac}

\item{title}{A title for the plot}

\item{colors}{If null, rainbow palette is used, otherwise another palette can
be specified (heat.colors, terrain.colors, topo.colors, cm.colors}

\item{...}{Additional arguments}
}
\value{
Creates a plot
}
\description{
Plots time activity curves from 1 or 2 participants or groups.
}
\examples{
# f_raw_tac and f_raw_vol are the filenames of PMOD-generated files
f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic") 
f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

tac <- load_tac(f_raw_tac)
vol <- load_vol(f_raw_vol)
AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=FALSE, PVC=FALSE)
plot(AD06_tac_nc, ROIs=c("frontal", "cerebellum"), title="Example Plot")
}
\seealso{
Other tac functions: 
\code{\link{save_tac}()},
\code{\link{split_pvc}()},
\code{\link{tac_roi}()}
}
\concept{tac functions}
