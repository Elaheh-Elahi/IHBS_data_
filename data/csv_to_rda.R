# Load necessary library
library(readr)

# Specify the path of the folder containing the CSV files
csv_folder_path <- "C:/Users/Dell/IHBS_data/data/97"

# Create a new folder in the current working directory for the RDA files
rda_folder_path <- "RDA_Files"
dir.create(rda_folder_path)

# Get a list of all CSV files in the folder
csv_files <- list.files(path = csv_folder_path, pattern = "\\.csv$", full.names = TRUE)

# Convert each CSV file to RDA and save in the new folder
for (file in csv_files) {
  data <- read_csv(file)
  rda_file_name <- paste0(tools::file_path_sans_ext(basename(file)), ".rda")
  rda_file_path <- file.path(rda_folder_path, rda_file_name)
  save(data, file = rda_file_path)
}

# install.packages ("usethis")
usethis::create_package ("~/mypackage")
# add data
usethis::use_data(, overwrite = TRUE)
library(usethis)
library(devtools)
setwd("~/mypackage")
use_data(R97Data, overwrite = TRUE)
