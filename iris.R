# Setup -------------------------------------------------------------------
# install.packages("caret")
# Caret is the top-level library. It is our API provider.
browseURL("http://topepo.github.io/caret/index.html")
library(caret)

# install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
# install.packages("party")
# install.packages("e1071")
library(party)

# Make results repeatable
set.seed(0)

# Get Data ----------------------------------------------------------------
# The data is already here!
browseURL("https://en.wikipedia.org/wiki/Iris_flower_data_set")
iris

# Expore the Data ---------------------------------------------------------
View(iris) # discuss data frames
class(iris)   
dim(iris) # rows=observations, columns=variables, 
names(iris) # independent/dependent variables, predictors/outcome, features/class
head(iris)
str(iris)
summary(iris)

# More about R -----------------------------------------------------------
browseURL("http://cran.r-project.org/doc/manuals/r-release/R-intro.html")

# What will this produce?
class("I am a string")
class('a')  # discuss vectors
class(iris$Species)

# Factors. 'Cause most statistician come out of the social sciences.
levels(iris$Species)

# R indexes start at 1 (one), not 0 (zero)
iris[1, 1]

# A , (comma blank) means give me everything
iris[1, ]

# Ranges of rows, subjset attributes by name
iris[1:5, c("Species")]

# The $ (dollar sign) and not the . (period) access attributes of a dataframe
iris$Species

# The - (minus sign) mean "no"
iris[49:52,-(1:2)]

# Logical vectors
iris$Sepal.Length > 7
iris[iris$Sepal.Length > 7, ]$Sepal.Width

# Visualize the Data ------------------------------------------------------
# Trellis plot of iris data
transparentTheme(trans = 0.4)
featureVectors =  iris[, 1:4]
classes = iris$Species
featurePlot(x = featureVectors,
            y = classes,
            plot = "pairs",
            auto.key = list(columns = 3))

# Parition the Data -------------------------------------------------------
# Create Training and Test Sets 
?createDataPartition

# Parition function guarantees representive number of samples
trainingIndexes = createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainingSet = iris[trainingIndexes, ]
testSet = iris[-trainingIndexes, ]

# Train a Decision Tree -------------------------------------------------------
# Create and train a model by defining the independent and dependent variables
model = Species ~ .
classifier = train(model, trainingSet, method="ctree")

# Decision trees are human-readable and very intuitive
plot(classifier$finalModel)

# Evaluate the Classifier  -------------------------------------------------------
# Predict the results for the test set
testPredictions  = predict(classifier, testSet)

# Look at confusion matrix and other metrics
confusionMatrix(testPredictions, testSet$Species)

# Exploring Confusion Models -------------------------------------------------------

# WHAT HAPPENS if we just guess "setosa" for everything?
# Effect on Accuracy? Effect on Kappa? Effecton P-Value? Sensitivity and Specificity?
confusionMatrix(
  rep("setosa", length(testPredictions)), 
  testSet$Species)

# WHAT HAPPENS if we guess randomly?
guessesWithCorrectProportions = sample(testSet$Species, length(testPredictions))
confusionMatrix(guessesWithCorrectProportions,  testSet$Species)
