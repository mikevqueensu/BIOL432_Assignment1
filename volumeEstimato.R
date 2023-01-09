args = commandArgs(trailingOnly=TRUE)

# x <- data.table::fread( file = "measurements.csv" ) -> df


# function that takes a file name as an argument and adds the volume column
f1 <- function(x = args[1]){
  
  # read in measurements.csv
  data.table::fread(x, data.table = F) -> df
  
  # assume limbs are cylinders and find volumne 
  df %>% dplyr::mutate(Volume = pi * (Limb_width/2) * Limb_length) -> df
  
  data.table::fwrite(x = df, file = "measurements.csv")
}


f1(args[1])


