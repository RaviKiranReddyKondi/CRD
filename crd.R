# at first download agricolae and agricolaeplotr package
#than load agricolae and agricolaeplotr
library(agricolae)
library(agricolaeplotr)
#use this command to clean the environment which are from previous sessions or analysis
rm(list=ls()) 
#### format of plot design crd command
plot_design_crd(
  design,
  ncols,
  nrows,
  y = "row",
  factor_name = "trt",
  labels = "plots",
  width = 1,
  height = 1,
  space_width = 0.95,
  space_height = 0.85,
  reverse_y = FALSE,
  reverse_x = FALSE
)

###### run this example
#create treatments into one variable called as "trt"
trt = c(1:10)
#save output as outdesign and run the commands at "r" mention the how many replications you need
outdesign=design.crd(trt,r=5,serie=3,2543,'Mersenne-Twister')
View(outdesign)
# making plot diagram with plot design crd command, mention the file name in the parentheses and when you run the veiw command
# you will get a window from where you can see the number of columns and rows, this can be entered in ncols and nrows, but the number of rows and columns 
# is to your convience
plot_design_crd(outdesign, ncols=10, nrows = 50)
##after running this command you will get to see the plot in plots section
# write the outdesign and use dollar sign to get the book of treatments and replications and save into a csv file
write.csv(outdesign$book,"crd.csv", row.names=TRUE)
 ###to see the saved file
file.show("crd.csv")


#####factorial crd
trt<-c(10,3) 

#  type number of treatments first and number of factor next for example t= 10 and f= 3 than factorial crd 10x3
#run design.ab command saving the output into outdesign1, the trt means treatments, r means replications and series shows 
##digits like series 2 means 10,11,12.... series e3 means 110,111,112,113.... and design crd
outdesign1 <- design.ab(trt, r=3, serie=2,design = 'crd')

#plot the outdesign1 and repeat the same process like first to know the row and column but they are changable
plot_design.factorial_crd(outdesign1,ncols = 8,nrows = 12)

#try this various types of adjusting the design of plots
plot_design.factorial_crd(outdesign1,reverse_y = TRUE,ncols = 8,nrows = 12)
plot_design.factorial_crd(outdesign1,reverse_y = TRUE,reverse_x = TRUE,ncols = 8,nrows = 8)

# write the outdesign and use dollar sign to get the book of treatments and replications and save into a csv file
write.csv(outdesign1$book,"fcrd.csv", row.names=TRUE)
###to see the saved file
file.show("fcrd.csv")




####ANOVA for simple crd############
#download doebioresearch package and load it to the working environment with library command
library(doebioresearch)

#create a data frame. to know how the data frame looks just run the data command and view(data)
data<-data.frame(Treatments=c("T1","T2","T3","T4","T5","T6","T7","T1","T2","T3","T4","T5","T6",
                              "T7","T1","T2","T3","T4","T5","T6","T7"),
                 yield=c(25,21,21,18,25,28,24,25,24,24,16,21,20,17,16,19,14,15,13,11,25),
                 height=c(130,120,125,135,139,140,145,136,129,135,150,152,140,148,130,135,145,160,145,130,160))
View(data)
#by using the class() command we know the data type like whether it is data frame or matrix or list etc
class(data)
#by using str() command we can know the variables and data type etc.,,
str(data)
#make treatments as factors
data$Treatments=as.factor(data$Treatments)
# if you are directly importing the data from excel or csv file use import in environment and use str() to know the data type
#CRD analysis with LSD test for yield only
crd1=crd(data[2],data$Treatments,1)
#CRD analysis with LSD test for both yield and height (two variables), in the same way you can do for multiple variables 
#data is data you upload and the number in the square brackets mention the columns number
#data$treaments is the treatments as vector
# 0 for no test, 1 for LSD test, 2 for Duncan test and 3 for HSD test comparisons
crd2=crd(data[2:3],data$Treatments,1)
crd2
### saving the anova results
# use sink() comand and mention the file name you want to save with extension (doc=document form)
sink('crd1.doc')
#by using print command we are saving the results into the file name mentioned above
print(crd1)
#again run the sink()comamand and check the working directory to see your results or you can use the file.show() command
sink()


########factorial crd#########

#####2factor crd############
###import the example data in doebioresearch package and view and run the class command to know the data structure 

data(factorialdata)
##it is mostly in data frame and adjust your own data accordingly and make that data as data frame after importing into the r 
View(factorialdata)
#Analysis of Factorial Completely Randomized design along with Dunccan test for Yield only
fcrd2fact(factorialdata[5],factorialdata$Nitrogen,factorialdata$Phosphorus,2)
#Analysis of Factorial Completely Randomized design along with Dunccan test for Yield & Plant Height
fcrd2fact(factorialdata[5:6],factorialdata$Nitrogen,factorialdata$Phosphorus,2)
#import the the out put same as normal crd mentioned above by assigning the command into a variable

####3 factor crd####
data(factorialdata)
#FCRD analysis along with dunccan test for two dependent var.
fcrd3fact(factorialdata[5:6],factorialdata$Nitrogen,
          factorialdata$Phosphorus,factorialdata$Potassium,2)

###thanks for all the researchers who made this packages, just writing all these command altogether for easing the work for all researchers and students
####any doubts please contact ravikiranreddykondi@gmail.com

