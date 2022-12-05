# SupportingFunctions.R
# Written by: Isaiah Murrell-Thomas and Bethany Oceguera 

# Function for summarizing data
## Ask user for directory containing all complied data
all_files_Dir = readline(prompt = "Input the working directory for the complied data: ") 
setwd(all_files_Dir)

## load compiled data
AllData = read.csv("allData.csv")

## Number of screens run
screenstotal = nrow(AllData) # The number of screens is equal to the number of rows in the compiled data
cat("The number of screens is equal to", screenstotal)

## Male vs Female
malecount = nrow(AllData[AllData$gender == "male",]) # Finding the number of males that were screened
femalecount = nrow(AllData[AllData$gender == "female",]) # Finding the number of females that were screened
cat("The number of males screened was", malecount)
cat("The number of females screened was", femalecount)

## Age distribution
# A histogram is a good way to look at age distribution for both countries 
Age = AllData$age
h=hist(Age, breaks = 50, xlim = c(0,100), ylim = c(0,26000), main = "Hisogram of Age Distribution From Screened Population")
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))
print("Any age over 100 is not represented in this graph, but they make up 178 data points")
### Based on this, it appears that the infection is effecting mostly people between the ages of 0-10

## Percent of people infected
infectedcounter = 0
for(i in 1:nrow(AllData)){
  for(j in 1:ncol(AllData)){
    if(AllData[i,j] == 1){
      infectedcounter = infectedcounter + 1
      break
    } 
  }
}
percentinfected = (infectedcounter/screenstotal)*100
cat("The percentage of infected people was",percentinfected,"percent")