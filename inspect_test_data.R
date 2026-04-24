source("/src/config.R")
tuned_models <- readRDS(file.path(results_dir, "tuned_model_results.rds"))
test_df <- tuned_models$rf$test_data
cat("RF test_data structure:\n")
str(test_df)
cat("\nUnique values in dx column of test_data:\n")
print(table(test_df$dx))
cat("\nClass of dx in test_data:\n")
print(class(test_df$dx))
