source("/src/config.R")
model_list <- readRDS(file.path(results_dir, "model_results.rds"))

cat("GLMNET performance column types:\n")
sapply(model_list$glmnet$performance, class)

cat("\nRF performance column types:\n")
sapply(model_list$rf$performance, class)
