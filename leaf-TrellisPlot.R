bookTheme()

plt = featurePlot(x = features,
                   y = cleanData$SpeciesName,
                   plot = "pairs",
                   auto.key = list(columns = 5),
                  pscales=FALSE)
update(plt, 
       par.settings = list(
         fontsize = list(text = 8, points = 2)))

# <<PLOT AFTER PCA>>
# What leaves are easy to distinguish from all others?
# What is a "typical leaf?
plt2 = featurePlot(x = pcaSet[,2:4],
                  y = pcaSet$SpeciesName,
                  plot = "pairs",
                  auto.key = list(columns = 5))
update(plt2, 
       par.settings = list(
         fontsize = list(text = 8, points = 9)))
