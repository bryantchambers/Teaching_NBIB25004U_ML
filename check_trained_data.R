source("/src/config.R")
tuned_models <- readRDS(file.path(results_dir, "tuned_model_results.rds"))
cat("RF trainingData columns:\n")
print(colnames(tuned_models$rf$trained_model$trainingData))
