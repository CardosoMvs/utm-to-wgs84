# 🌍 Coordinate Converter

**A simple R tool for converting and validating geographic coordinates between UTM and WGS84 systems**   

## 📝 Description  
This R script provides a straightforward workflow to:  
- Import coordinate data from CSV files  
- Clean and validate coordinate values  
- Convert between SIRGAS 2000 UTM 22S (EPSG:31982) and WGS84 (EPSG:4326) systems  
- Export data to Excel format  

Perfect for researchers and professionals needing quick coordinate transformations with data validation.  

## 🛠️ Features  
- **Automatic validation** of coordinate inputs  
- **Coordinate system conversion** (UTM ↔ WGS84)  
- **Data cleaning** (handles missing/non-numeric values)  
- **Simple Excel output** with properly labeled columns  

## 📦 Installation  
1. Ensure you have R installed  
2. Install required packages:  
```r
install.packages(c("sf", "openxlsx"))
```

## 🚀 Usage  
1. Edit the file paths in the script  
2. Run the script in R/RStudio  
3. Check console for processing messages  
4. Find results in your output Excel file  

## 📄 Sample Code  
```r
# Load packages
library(sf)
library(openxlsx)

# Set your file paths here
input_path <- "your_data.csv"
output_path <- "converted_data.xlsx"

# [Rest of the script...]
```
