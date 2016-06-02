
pcaResults <- prcomp(features,
                       center = TRUE,
                       scale. = TRUE,
                       retx=TRUE)
summary(pcaResults)

pcaFeatures = pcaResults$x[,1:4]
pcaSet = data.frame(SpeciesName=cleanData$SpeciesName, pcaFeatures)

fit = train(model, pcaSet[trainingIndices,])
testSet = pcaSet[-trainingIndices,]
predictions = predict(fit, testSet[,-1])
leafPerformance(predictions)
