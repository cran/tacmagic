% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dvr.R
\name{dvr}
\alias{dvr}
\title{Distribution volume ratio (DVR) for one or more ROIs}
\usage{
dvr(
  tac,
  model = "logan",
  target = NULL,
  ref,
  k2prime,
  t_star,
  error = 0.1,
  method = "trapz"
)
}
\arguments{
\item{tac}{The time-activity curve data from load_tac() or tac_roi()}

\item{model}{Only model currently available is "logan"}

\item{target}{Optional - otherwise will calculate DVR for all regions}

\item{ref}{Required -- The reference region, e.g. "cerebellum"}

\item{k2prime}{Required -- A fixed value for k2' must be specified (e.g. 0.2)}

\item{t_star}{Required -- If 0, t* will be calculated using find_t_star()}

\item{error}{For find_t_star()}

\item{method}{Method of integration, "trapz" or "integrate"}
}
\value{
Data frame with calculated DVRs
}
\description{
This calculates the DVR using the non-invasive reference Logan method for
all TACs in a supplied tac file. It uses DVR_ref_Logan if a target ROI is 
specified, otherwise will calculate DVR for all ROIs with DVR_ref_all_Logan()
}
\details{
For other model parameters, directly call DVR_ref_Logan().
}
\examples{
f <- system.file("extdata", "AD06.tac", package="tacmagic")
fv <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
AD06_tac <- load_tac(f, format="PMOD")
AD06_volume <- load_vol(fv, format="voistat")
AD06 <- tac_roi(tac=AD06_tac, volumes=AD06_volume, ROI_def=roi_ham_pib(),  
                merge=FALSE, PVC=FALSE)  

AD06_DVRs <- dvr(AD06, ref="cerebellum", k2prime=0.2, t_star=23)

AD06_DVR <- dvr(AD06, target="frontal", ref="cerebellum", 
             k2prime=0.2, t_star=23)
}
\references{
Logan, J., Fowler, J. S., Volkow, N. D., Wang, G.-J., 
Ding, Y.-S., & Alexoff, D. L. (1996). Distribution Volume Ratios without 
Blood Sampling from Graphical Analysis of PET Data. Journal of Cerebral 
Blood Flow & Metabolism, 16(5), 834-840. 
https://doi.org/10.1097/00004647-199609000-00008
}
\seealso{
Other Logan plot functions: 
\code{\link{DVR_all_ref_Logan}()},
\code{\link{DVR_ref_Logan}()},
\code{\link{plot.ref_Logan}()}
}
\concept{Logan plot functions}
