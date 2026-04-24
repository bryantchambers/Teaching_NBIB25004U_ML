library(mikropml)
library(dplyr)

# Load the example dataset
data("otu_mini_bin")

# Inspect the structure
cat("--- Dataset Structure ---\n")
str(otu_mini_bin)

cat("\n--- First few rows ---\n")
print(head(otu_mini_bin))

cat("\n--- Summary of Outcome (dx) ---\n")
print(table(otu_mini_bin$dx))
