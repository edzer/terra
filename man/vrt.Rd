\name{vrt}

\docType{methods}

\alias{vrt}
\alias{vrt,character-method}


\title{Virtual Raster Dataset}

\description{ 
Create a Virtual Raster Dataset (VRT) from a collection of file-based raster datasets (tiles). 
}

\usage{
\S4method{vrt}{character}(x, filename="", options=NULL, overwrite=FALSE)
}

\arguments{
  \item{x}{character. Filenames of raster "tiles". See \code{\link{tiles}}}
  \item{filename}{character. Output VRT filename}  
  \item{options}{character. All arguments as separate vector elements. Options as for \href{https://gdal.org/programs/gdalbuildvrt.html}{gdalbuildvrt}}
  \item{overwrite}{logical. Should \code{filename} be overwritten if it exists?}
}

\value{
SpatRaster
}

\note{
A VRT can reference very many datasets. These are not all opened at the same time. The default is to open not more than 100 files. To increase performance, this maximum limit can be increased by setting the GDAL_MAX_DATASET_POOL_SIZE configuration option to a bigger value with \code{\link{setGDALconfig}}. Note that a typical user process on Linux is limited to 1024 simultaneously opened files.
}

\seealso{
\code{\link{makeTiles}} to create tiles; \code{\link{makeVRT}} to create a .vrt file for a binary raster file that does not have a header file.
}

\examples{
r <- rast(ncols=100, nrows=100)
values(r) <- 1:ncell(r)
x <- rast(ncols=2, nrows=2)
filename <- paste0(tempfile(), "_.tif")
ff <- makeTiles(r, x, filename)
ff

#vrtfile <- paste0(tempfile(), ".vrt")
#v <- vrt(ff, vrtfile)


## output in lower resolution
#vrtfile <- paste0(tempfile(), ".vrt")
#v <- vrt(ff, vrtfile, options = c("-tr", 5, 5))
#head(readLines(vrtfile))
#v
}


\keyword{methods}
\keyword{spatial}
