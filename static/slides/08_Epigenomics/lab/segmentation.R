library(RcppHMM) # For Hidden Markov Models
library(DNAcopy) # for Circular Binary Segmentation
library(EnsDb.Hsapiens.v86)
library(GenomeInfoDb)

# Get list of genes
edb <- EnsDb.Hsapiens.v86
g <- genes(edb, filter = AnnotationFilterList(GeneIdFilter("ENSG", "startsWith")))
x <- keepSeqlevels(g, c("2"), pruning.mode = "coarse") # Chr2 only as example

# Tile the genome into windows
query <- tileGenome(seqlengths(x)[seqnames(x)@values], tilewidth = 5e5, cut.last.tile.in.chrom = TRUE)
# Calculate gene density per window
counts <- countOverlaps(query, x)
# Plot the results
plot(sqrt(counts))

# HMM
hmm <- initPHMM(n = 2) # Three states
hmm <- learnEM(hmm,
               counts,
               iter = 400,
               delta = 1e-5,
               print = TRUE
)
# hmm
# Find states with the Viterbi algorithm
v <- as.integer(factor(viterbi(hmm, counts), levels = hmm$StateNames))
plot(sqrt(counts), col = v, xlim = c(200, 400))
abline(h=3)
