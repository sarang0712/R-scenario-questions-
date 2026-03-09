# Install the package to your custom folder
install.packages("nycflights23", 
                 lib = "C:/Users/gujarathis/Desktop/Yasmin Task")

# Set the library path (make sure P is capitalized)
.libPaths(c("C:/Users/gujarathis/Desktop/Yasmin Task", .libPaths()))

# Check library paths
.libPaths()

# Load the package
library(nycflights23)

chooseCRANmirror()

options(repos = c(CRAN = "https://cloud.r-project.org"))

capabilities("libcurl")

options(download.file.method = "libcurl")
options(repos = c(CRAN = "https://cloud.r-project.org"))

install.packages("nycflights23")

# Install the package to your custom folder
install.packages("nycflights23", 
                 lib = "C:/Users/gujarathis/Desktop/Yasmin Task")

# Set the library path (make sure P is capitalized)
.libPaths(c("C:/Users/gujarathis/Desktop/Yasmin Task", .libPaths()))

# Check library paths
.libPaths()

# Load the package
library(nycflights23)
head(airlines)
install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)