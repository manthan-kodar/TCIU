% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fmri_3dvisual_region.R
\name{fmri_3dvisual_region}
\alias{fmri_3dvisual_region}
\title{visualization of the 3D brain with the activated areas by regions}
\usage{
fmri_3dvisual_region(
  pval,
  mask,
  label_index,
  label_name,
  top_num = NULL,
  p_threshold = 0.05,
  method = "scale_p",
  multi_pranges = TRUE,
  color_pal = "YlOrRd",
  rank = NULL,
  title = NULL
)
}
\arguments{
\item{pval}{a 3D or 1D or a list of two 3D array of p-values used to plot activated area of the brain}

\item{mask}{a 3D nifti or 3D array of data to show the regions of the brain}

\item{label_index}{a 1D array listing  the label number in the mask}

\item{label_name}{a 1D array corresponding to the name of the label number in the mask}

\item{top_num}{NULL or a numeric value that used for 1D p-values. If specified, the output will 
show the top num significant regions. The default is NULL.}

\item{p_threshold}{NULL or a numeric value that used for 3D p-values can be selected randomly below 0.05 to 
drop all p-values above the threshold. If 'low5_percent' method is used, 
make 'p_threshold' as NULL. The default is 0.05.}

\item{method}{a string that represents method for the 3D p-values plot.
There are 2 options: 'scale_p' and 'low5_percent'. The default is 'scale_p'. 
'scale_p' is to draw the plot with fixed color scale for fixed range of p value.
'low5_percent' is to draw the plot for the smallest 5 percent of p value when all the p values are not significant.}

\item{multi_pranges}{an option under 'scale_p' method to decide whether there are at most 9 colors 
in the legend for the ranges of 3D p-values, or at most 4 colors. 
The default is TRUE, choosing the larger number of colors for the plot.}

\item{color_pal}{the name of the color palettes provided by \code{RColorBrewer}. The default is "YlOrRd".}

\item{rank}{the method that how the trace is ranked. The default is NULL.
There are 2 options: 'value' and a vector.
'value' is to draw the 1D p-values by the values from smallest to largest.
a vector is to specific the rank of the regions in 3D p-values plot.}

\item{title}{the title of the plot. The default is NULL.}
}
\value{
the 3d plot of the fMRI data drawn by \code{plotly}
}
\description{
an improved visualization method of \code{fmri_3dvisual}, using \code{plotly} to 
draw the 3D plot of the brain with the activated areas region by region
}
\details{
The function \code{fmri_3dvisual_region} is used to visualize the 3D plot of the brain 
with activated parts region by region. When providing a 1D/3D p-values data, a 3D interactive
plot with surface of the brain shell will be generated with either scatter points representing 
different stimulated levels or large color pieces representing different regions of the brain. 
When providing a list of two 3D array of p-values, two 3D interactive brains with different scatter
points corresponding to the two input 3D p-values will be given.
}
\examples{
# sample label vector provided in the package
label_index = mask_dict$index
label_name = as.character(mask_dict$name)
label_mask = mask_label
\donttest{
fmri_3dvisual_region(phase1_pval, label_mask, label_index,
                     label_name, title = "phase1 p-values")
fmri_3dvisual_region(phase1_pval, label_mask, label_index,
                     label_name, 5, title = "phase1 top five p-values", rank = "value")

# for 3D visualization, user needs to include empty region in the label
label_index = c(0, label_index)
label_name = c("empty", label_name)
fmri_3dvisual_region(phase2_pval, label_mask, label_index,
                     label_name, title = "phase2 p-values", rank = c(1:length(label_name)))
fmri_3dvisual_region(list(phase2_pval,phase3_pval), label_mask, label_index,
                     label_name, title = "phase2&3 p-values")
}
}
\author{
SOCR team <\url{http://socr.umich.edu/people/}>
}
