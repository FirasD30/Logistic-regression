# Make sure to run logistic_regression_1.R first

# Calculate odds ratio for death at dose 1 vs death at dose 0.1
(probs[3] / (1 - probs[3])) / (probs[2] / (1 - probs[2]))
