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

# Access - cran.r-project.org/doc/manuals/r-release/R-intro.html

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

# Second Data Set
## Load data and provide attribute names
leafData = read.csv(
  "leaf.csv",
  header = FALSE,
  col.names = c(
    "Species",
    "Specimen Number",
    "Eccentricity",
    "Aspect Ratio",
    "Elongation",
    "Solidity",
    "Stochastic Convexity",
    "Isoperimetric Factor",
    "Maximal Indentation Depth",
    "Lobedness",
    "Average Intensity",
    "Average Contrast",
    "Smoothness" ,
    "Third moment" ,
    "Uniformity",
    "Entropy"
  )
)

## Convert species number to labeled factor.
speciesLabels = c(
  "Quercus suber",
  "Salix atrocinera",
  "Populus nigra",
  "Alnus sp.",
  "Quercus robur",
  "Crataegus monogyna",
  "Ilex aquifolium",
  "Nerium oleander",
  "Betula pubescens",
  "Tilia tomentosa",
  "Acer palmatum",
  "Celtis sp.",
  "Corylus avellana",
  "Castanea sativa",
  "Populus alba",
  "Acer negundo",
  "Taxus bacatta",
  "Papaver sp.",
  "Polypolium vulgare",
  "Pinus sp.",
  "Fraxinus sp.",
  "Primula vulgaris",
  "Erodium sp.",
  "Bougainvillea sp.",
  "Arisarum vulgare",
  "Euonymus japonicus",
  "Ilex perado ssp. azorica",
  "Magnolia soulangeana",
  "Buxus sempervirens",
  "Urtica dioica",
  "Podocarpus sp.",
  "Acca sellowiana",
  "Hydrangea sp.",
  "Pseudosasa japonica",
  "Magnolia grandiflora",
  "Geranium sp.",
  "Aesculus californica",
  "Chelidonium majus",
  "Schinus terebinthifolius",
  "Fragaria vesca"
)

leafFeatures = leafData
leafFeatures$SpeciesNames = factor(leafFeatures$Species)
usedSpecies = speciesLabels[unique(leafData$Species)]
levels(leafFeatures$SpeciesNames) = usedSpecies

## Get rid of "Species" and Specimen Number"
leafFeatures = leafFeatures[, c(-1, -2)]

## Partition 
leafTrainIdx = createDataPartition(leafFeatures$SpeciesNames, p = 0.8, list=FALSE, preProcess())
leafTrainingSet = leafFeatures[leafTrainIdx]
leafTestSet = leafFeatures[-leafTrainIdx]

## Create model
leafModel = SpeciesNames ~ .
leafFit = train(leafModel, leafTrainingSet)


# Preprocess and Train
ctrl2 <- trainControl(method = "adaptive_cv",
                      repeats = 1,
                      verboseIter = FALSE)
leafFit2 = train(leafModel, 
                 leafFeatures, 
                 method="Boruta"
                 );
confusionMatrix(leafFit2)


## How can we do better?
# Tweak our preprocessing and feature selection.
# Tweak our machine learning algorithm and parameters.
# GET MORE DATA.


