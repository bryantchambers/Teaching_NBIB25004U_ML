source("/src/config.R")
tuned_models <- readRDS(file.path(results_dir, "tuned_model_results.rds"))
train_df <- tuned_models$rf$trained_model$trainingData
cat("RF trainingData structure:\n")
str(train_df)
cat("\nRF trainingData classes:\n")
print(sapply(train_df, class))
