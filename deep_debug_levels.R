source("/src/config.R")
library(dplyr)
tuned_models <- readRDS(file.path(results_dir, "tuned_model_results.rds"))

inspect_df <- function(df, name) {
  cat("\n---", name, "---\n")
  outcome <- df[["dx"]]
  cat("Class:", class(outcome), "\n")
  if (is.factor(outcome)) {
    cat("Levels:", paste(levels(outcome), collapse=", "), "\n")
    cat("Unique values in data:", paste(unique(as.character(outcome)), collapse=", "), "\n")
    cat("Table:\n")
    print(table(outcome, useNA="always"))
  } else {
    cat("Unique values:", paste(unique(outcome), collapse=", "), "\n")
  }
}

inspect_df(tuned_models$rf$trained_model$trainingData %>% 
             rename(dx = .outcome), "Training Data Raw")
inspect_df(tuned_models$rf$test_data, "Test Data Raw")

# Test the conversion logic
prepare_data_for_importance <- function(df, outcome_name) {
  if (".outcome" %in% colnames(df)) {
    colnames(df)[colnames(df) == ".outcome"] <- outcome_name
  }
  df[[outcome_name]] <- factor(df[[outcome_name]], levels = c("cancer", "normal"))
  return(df)
}

train_fixed <- prepare_data_for_importance(tuned_models$rf$trained_model$trainingData, "dx")
test_fixed <- prepare_data_for_importance(tuned_models$rf$test_data, "dx")

inspect_df(train_fixed, "Fixed Training Data")
inspect_df(test_fixed, "Fixed Test Data")
