# Make sure to run logistic_regression_1.R first

# Calculate entries in confusion matrix
true_positives = sum(probs*Dead)
false_positives = sum((1 - probs) * Dead)
false_negatives = sum(probs * Alive)
true_negatives = sum((1 - probs) * Alive)
confusion_matrix = cbind(c(true_positives, false_positives), c(false_negatives, true_negatives))

