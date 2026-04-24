source("/src/config.R")
library(mikropml)
library(caret)
tuned_models <- readRDS(file.path(results_dir, "tuned_model_results.rds"))
model <- tuned_models$rf$trained_model
test_data <- tuned_models$rf$test_data
test_data$dx <- factor(test_data$dx, levels = c("cancer", "normal"))

cat("Model classes:\n")
print(model$levels)

# Try manual prediction
preds <- predict(model, test_data, type = "prob")
cat("\nFirst few predictions:\n")
print(head(preds))

# Try manual metric calculation
perf <- calc_perf_metrics(test_data, model, outcome_colname = "dx", 
                          perf_metric_function = caret::multiClassSummary, 
                          class_probs = TRUE)
cat("\nManual performance calculation:\n")
print(perf)
