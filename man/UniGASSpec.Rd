\name{UniGASSpec}
\alias{UniGASSpec}
\title{
	Univariate GAS specification
}
\description{
	Specify the conditional distribution, scaling mechanism and time--varying parameters for univariate GAS models.
}
\usage{
UniGASSpec(Dist = "norm", ScalingType = "Identity",
           GASPar = list(location = FALSE, scale = TRUE,
                         skewness = FALSE, shape = FALSE, shape2 = FALSE))
}
\arguments{
\item{Dist}{
\code{character} Indicating the label of the conditional distribution.
Available distribution can be displayed using the function \link{DistInfo}.
Default value\code{Dist = "norm"}.}
%
\item{ScalingType}{
\code{character} Indicating the scaling mechanism for the conditional score.
Possible choices are \code{"Identity"}, \code{"Inv"},
 \code{"InvSqrt"}. Note that, for some distribution only \code{ScalingType = "Identity"} is supported, see the function \link{DistInfo}.
 When  \code{ScalingType = "InvSqrt"} the inverse of the cholesky decomposition of the information matrix is used.
 Default value \code{ScalingType = "Identity"}.}
%
\item{GASPar}{
\code{list} Containing information about which parameters of the conditional distribution have to be time-varying.
\code{location = TRUE} refers to the location parameter, \code{scale = TRUE} refers to the scale
parameter, \code{skewness = TRUE} refers to the parameter controlling the skewness, \code{shape = TRUE} refers
to the shape parameter (e.g. the degree of freedom of the Student-t distribution), \code{shape2 = TRUE} refers to
the second shape parameter. If the distribution specified in the \code{Dist} argument does not have,
say, a shape parameter, the condition \code{shape = TRUE} or \code{shape = FALSE} is ignored. Note that, for some
distributions, these labels are not strictly related to their literal statistical meaning. Indeed,
for the Exponential distribution \code{exp}, the term \code{location} indicates the usual intensity rate parameter.
See the \link{DistInfo} function for more details.}
%
}
\details{
	All the information regarding the supported univariate conditional distributions
	can be investigated using the \link{DistInfo} function.
}
\value{
An object of the class \link{uGASSpec}.
}
\references{
Ardia D, Boudt K and Catania L (2016).
"Generalized Autoregressive Score Models in R: The GAS Package."
\url{https://www.ssrn.com/abstract=2825380}.\cr

Creal D, Koopman SJ, Lucas A (2013).
"Generalized Autoregressive Score Models with Applications."
Journal of Applied Econometrics, 28(5), 777-795.
\doi{10.1002/jae.1279}.\cr

Harvey AC (2013).
Dynamic Models for Volatility and Heavy Tails: With Applications to Financial and Economic Time Series.
Cambridge University Press.
}
\author{Leopoldo Catania}
\examples{
# Specify an univariate GAS model with Student-t
# conditional distribution and time-varying location, scale and shape parameter
library("GAS")

GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
                     GASPar = list(location = TRUE,
                                   scale = TRUE, shape = TRUE))

GASSpec
}
