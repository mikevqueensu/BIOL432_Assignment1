species <- c("Vicugna pacos","Felis catus","Pan troglodytes","Cricetulus griseus","Homo sapiens")
observers <- c("John Cena","Brock Lesnar","Bruce Lee")

# samples the species vector 100 times
sample(x = species, replace = T, size = 100) -> df

# samples the observers vector 100 times
sample(x = observers, replace = T, size = 100) -> obs

# Loops species and samples a limb width value specific to that species
lapply(X = 1:length(df), FUN = function(x){
  df[x] -> y 
  if(y == "Vicugna pacos"){return(rnorm(n = 1, mean = 5, sd = 0.2))} else if(y == "Felis catus"){
   return(rnorm(n = 1, mean = 1, sd = 0.2))} else if(y == "Pan troglodytes"){
   return(rnorm(n = 1, mean = 5, sd = 0.5))} else if(y == "Cricetulus griseus"){
   return(rnorm(n = 1, mean = 0.5, sd = 0.05))} else{return(rnorm(n = 1, mean = 3, sd = 0.2))}
        
}) -> out1

# Loops species and samples a limb length value specific to that species
lapply(X = 1:length(df), FUN = function(x){
  
  df[x] -> y 
  if(y == "Vicugna pacos"){return(rnorm(n = 1, mean = 60, sd = 3))} else if(y == "Felis catus"){
    return(rnorm(n = 1, mean = 10, sd = 1))} else if(y == "Pan troglodytes"){
      return(rnorm(n = 1, mean = 40, sd = 2))} else if(y == "Cricetulus griseus"){
        return(rnorm(n = 1, mean = 3, sd = 0.1))} else{return(rnorm(n = 1, mean = 35, sd = 4))}
}) -> out2 

# merge values and convert to data.frame
cbind(df,out1,out2,obs) %>% as.data.frame() -> df

# rename columns
names(df) <- c("Organism","Limb_width","Limb_length","Observer")

# export
data.table::fwrite(x = df, file = "measurements.csv")



