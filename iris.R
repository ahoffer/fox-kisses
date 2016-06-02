library(caret)
# cran.r-project.org/web/packages/caret/vignettes/caret.pdf
# topepo.github.io/caret/index.html
# ---------------------------------------------------------
library(AppliedPredictiveModeling)
library(party)

# Make results repeatable
set.seed(1)

##### Explore #####
iris
class(iris)
dim(iris)
names(iris)
head(iris)
str(iris)
summary(iris)

##### Learn about R #####
# What will this produce?
class("I am a string")
class('a')
class(iris$Species)

# Factors. 'Cause most statistician come out of the social sciences.
str(iris$Species)

# Accessing values in data frames - cran.r-project.org/doc/manuals/r-release/R-intro.html

## R indexes start at 1 (one), not 0 (zero)
iris[1, 1]

## A , (comma) means give me everything
iris[1, ]

## Ranges of rows, subjset attributes by name
iris[1:5, c("Species")]

## The $ (dollar sign) and not the . (period) access attributes of a dataframe
iris$Species

## The - (minus sign) mean "no"
iris[49:52,-(1:2)]

## Logical vectors
iris$Sepal.Length > 7
iris[iris$Sepal.Length > 7.5, ]$Species

##### Visualize #####
#-Trellis plot of iris data
transparentTheme(trans = 0.4)
featurePlot(x = iris[,-5],
            y = iris$Species,
            plot = "pair",
            auto.key = list(columns = 3))

##### Create Training and Test Sets #####
?createDataPartition
trainingIndexes = createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainingSet = iris[trainingIndexes, ]
testSet = iris[-trainingIndexes, ]

##### Learn! - Decision Tree #####
# Create a model by defining the independent and dependent variables
model = Species ~ .

# Create a decision tree to classify samples of irises
decisionTree = train(model, trainingSet, method="ctree")

# Decision trees are human-readable and very intuitive
plot(decisionTree$finalModel)

##### Evaluate! #####
# How well did we do on the test data?

# Predict the results for the test set
testPredictions  = predict(decisionTree, testSet)

# Look at confusion matrix and other metrics
confusionMatrix(testPredictions, testSet$Species)

# WHAT HAPPENS if we just guess "setosa" for everything?
# Effect on Accuracy? Effect on Kappa? Effecton P-Value?
confusionMatrix(
  rep("setosa", length(testPredictions)), 
  testSet$Species)

# WHAT HAPPENS if we guess randomly? (WITHOUT replacement)
guessesWithCorrectProportions = sample(testSet$Species, length(testPredictions))
confusionMatrix(guessesWithCorrectProportions,  testSet$Species)

# WHAT HAPPENS if we guess randomly? (WITH replacment)
guesses = sample(testSet$Species, length(testPredictions), replace = TRUE)
confusionMatrix(guesses,  testSet$Species)




