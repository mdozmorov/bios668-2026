# https://github.com/BenLangmead/ads1-slides/blob/master/0420_approx__editdist.pdf
# https://www.youtube.com/watch?v=8Q2IEIY2pDU&list=PL2mpR0RYFQsBiCWVJSvVAO3OJ2t7DzoHA&index=33
# https://nbviewer.jupyter.org/github/BenLangmead/comp-genomics-class/blob/master/notebooks/CG_DP_EditDist.ipynb

edDistRecursive <- function(x, y){
  # Base cases: Return c(distance, count=1)
  # count is 1 because we count *this* specific call
  if (nchar(x) == 0) {
    return(c(nchar(y), 1))
  }
  if (nchar(y) == 0) {
    return(c(nchar(x), 1))
  }
  
  # Logic (using your original indexing)
  delt <- ifelse(substr(x, nchar(x) - 1, nchar(x) - 1) != substr(y, nchar(y) - 1, nchar(y) - 1), 1, 0)
  
  # 1. Execute the three recursive calls explicitly to capture their returns
  # Each 'res' is a vector: c(distance, accumulated_calls)
  res_sub <- edDistRecursive(substr(x, 1, nchar(x) - 1), substr(y, 1, nchar(y) - 1))
  res_del <- edDistRecursive(substr(x, 1, nchar(x) - 1), y)
  res_ins <- edDistRecursive(x, substr(y, 1, nchar(y) - 1))
  
  # 2. Calculate the minimal distance (looking at index 1 of results)
  min_dist <- min(res_sub[1] + delt, 
                  res_del[1] + 1, 
                  res_ins[1] + 1)
  
  # 3. Calculate total calls (Sum of all children's counts + 1 for self)
  total_calls <- 1 + res_sub[2] + res_del[2] + res_ins[2]
  
  return(c(min_dist, total_calls))
}

# --- Usage ---
result <- edDistRecursive("cat", "cut")
cat("Edit Distance:", result[1], "\n")
cat("Total Recursive Calls:", result[2], "\n")

x <- "ATCG"
y <- "AGGG"
edDistRecursive(x, y)

x <- "shake spea"
y <- "Shakespear"
edDistRecursive(x, y)

x <- "shakespea"
y <- "snakespea"
edDistRecursive(x, y)
