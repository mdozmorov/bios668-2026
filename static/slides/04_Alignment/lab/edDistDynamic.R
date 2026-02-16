# https://github.com/BenLangmead/ads1-slides/blob/master/0440_approx__editdist3.pdf
# https://www.youtube.com/watch?v=Xg6uyW9Bscs&list=PL2mpR0RYFQsBiCWVJSvVAO3OJ2t7DzoHA&index=35
# https://nbviewer.jupyter.org/github/BenLangmead/comp-genomics-class/blob/master/notebooks/CG_kEditDp.ipynb

edDistDynamic <- function(x, y){
  # Initialize an operations counter
  iterations <- 0
  
  D = matrix(data = 0, nrow = nchar(x) + 1, ncol = nchar(y) + 1)
  
  # Initialization loops do not count as "distance calculations", 
  # but strictly speaking, they are iterations. 
  # Usually, we care about the nested loop complexity:
  for (i in 1:(nchar(x) + 1)) {
    D[i, 1] <- i - 1
  }
  for (i in 1:(nchar(y) + 1)) {
    D[1, i] <- i - 1
  }
  
  # Main logic
  for (i in 2:(nchar(x) + 1)) {
    for (j in 2:(nchar(y) + 1)) {
      
      # Increment counter for every cell calculation
      iterations <- iterations + 1
      
      distVer <- D[i, j - 1] + 1
      distHor <- D[i - 1, j] + 1
      
      if (substr(x, i - 1, i - 1) == substr(y, j - 1, j - 1)) {
        distDiag <- D[i - 1, j - 1]
      } else {
        distDiag <- D[i - 1, j - 1] + 1
      }
      D[i, j] <- min(distVer, distHor, distDiag)
    }
  }
  
  # Return both the distance and the number of iterations
  return(c(D[nrow(D), ncol(D)], iterations))
}

# --- Example Usage ---
# Comparing "execution" vs "intention"
# For length 3 vs 3 ("cat", "cut"):
# Recursive calls: 94
# DP iterations: 3 * 3 = 9
result <- edDistDynamic("cat", "cut")
cat("Edit Distance:", result[1], "\n")
cat("Computations (Iterations):", result[2], "\n")

x="shake spea"
y="Shakespear"

edDistDynamic(x, y)
