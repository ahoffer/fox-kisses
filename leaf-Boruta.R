source("leaf-DataPreparation.R")

fitBoruta = train(model,                 trainingSet,                  method =
                    "Boruta")


leafPerformance(predict(fitBoruta, testSet))

# Accuracy                  Kappa       Mean_Sensitivity       Mean_Specificity    Mean_Pos_Pred_Value
# 0.84482759             0.83928571             0.85000000             0.99464286             0.87777778
# Mean_Neg_Pred_Value    Mean_Detection_Rate Mean_Balanced_Accuracy
# 0.99469507             0.02816092             0.92232143

write.csv(leafConfusionMatrix(predictions), file = "leafConfusionMatrixBoruta.csv")

#################################
##### How can we do better? #####
#################################

#-Tweak our preprocessing and feature selection?
#--Big gains for the right features. Slowly becomming less and less important.
#--This was boruta's advantage over the vanilla Random Forest.

#-Tweak our machine learning algorithm and parameters?
#--Quickly becomming less and less important thanks to ensemble learning and deep learning
fit = train(model, trainingSet, method = "LogitBoost")
leafPerformance(predict(fit, testSet))
  # Accuracy                  Kappa      
  # 0.8611111              0.8542510

#-The correct ansswers is GET MORE DATA.
#--Often the cheapests and most effective way to improve outcomes is to throw more training
#--at the classifier. This leads to BIG DATA.