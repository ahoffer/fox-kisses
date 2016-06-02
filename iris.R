# Make results repeatable
set.seed(1)

# Explore
iris
class(iris)
dim(iris)
names(iris)
head(iris)
str(iris)
summary(iris)

## What will this produce
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


# Learn
# cran.r-project.org/web/packages/caret/vignettes/caret.pdf
# topepo.github.io/caret/index.html
library(caret)

# Create training and test sets
?createDataPartition
trainingIndexes = createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainingSet = iris[trainingIndexes, ]
testSet = iris[-trainingIndexes, ]

# Create a model by defining the independent and dependent variables
model = Species ~ .

# "Fit" the model to the training data
fit = train(model, trainingSet)

# How well did we do on the training data?
confusionMatrix(fit)

# Predict the results for the test set
testPredictions  = predict(fit, testSet)

# How well did we do on the test data?
confusionMatrix(testPredictions, testSet$Species)
multiClassSummary(data.frame(pred = testPredictions, obs = testSet$Species),
                  lev = levels(iris$Species))

# What happens if we just guess "setosa" for everything
confusionMatrix(rep("setosa", length(testPredictions)), testSet$Species)

# Trellis plot of iris data
library(AppliedPredictiveModeling)
transparentTheme(trans = 0.4)
featurePlot(x = iris[,-5],
                   y = iris$Species,
                   plot = "ellipse",
                   auto.key = list(columns = 3))