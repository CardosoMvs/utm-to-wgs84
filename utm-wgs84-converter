# ===================================================================
# Coordinate System Conversion Tool
# Converts UTM coordinates (SIRGAS 2000 UTM 22S) to WGS84 (EPSG:4326)
# Performs data validation and cleaning of input coordinates
# Outputs to Excel with standardized column names
#
# Input:  CSV with X/Y UTM coordinates (EPSG:31982)
# Output: Excel file with Longitude/Latitude (decimal degrees)
#
# Dependencies: sf, openxlsx
#
# contact: cardoso.mvs@gmail.com
# ===================================================================

library(sf)
library(openxlsx)

# Set file paths
input_file <- "path/to/your/input.csv" 
output_file <- "path/to/output.xlsx"

# Read and validate data
data <- read.csv(input_file)
data$X <- as.numeric(as.character(data$X))
data$Y <- as.numeric(as.character(data$Y))
data <- na.omit(data)

# Coordinate conversion
sf_data <- st_as_sf(data, coords = c("X", "Y"), crs = 31982)
wgs_data <- st_transform(sf_data, crs = 4326)

# Prepare output
output <- cbind(data, st_coordinates(wgs_data))
colnames(output)[colnames(output) %in% c("X", "Y")] <- c("Longitude", "Latitude")

# Export results
write.xlsx(output, output_file, rowNames = FALSE)
