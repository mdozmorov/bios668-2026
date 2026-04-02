---
title: "Final Project Assignment: single-cell RNA-seq Data Analysis"
output: html_document
---
<!--
Write a proposal for your final project. Please, refer to https://mdozmorov.github.io/BIOS567.2017/presentations/16_final_project/index.html for minimal requirements. Make the project interesting for yourself and others who will read it. Describe the following:

- What is the self-explanatory title of your project?
- What dataset are you using? Provide GEO ID.
- What is the experimental question you are trying to answer? E.g., what are you comparing?
- What technology (e.g., gene expression) it is?
- What platform (e.g., HGU133A)?
- Are results from the paper publishing the data you selected available for you to compare your findings with published findings? Alternatively, are you asking a different experimental question not envisioned in the original study?

Use normal page margins, 11 pt Arial font. Your proposal is expected to be from 1/2 to 1 page long.
-->

## Key dates

- **May 5, 2026** - The complete [Submission](#submission-instructions) is due.
- **May 8, 2026** - The [Peer-review](#peer-review-process) assessment is due.
- **May 12, 2026** - Final grades are due by noon, VCU requirement.

## Overview

The purpose of the final project is to gain hands-on experience with the **full spectrum of single-cell RNA-seq analysis methods** applied to real-world data. This project is designed to help you strengthen both your **statistical** and **practical** understanding of scRNA-seq data analysis.

Your goal is to perform a **complete and reproducible analysis** and **interpretation** of an scRNA-seq dataset. The project should include all key analytical steps — raw data retrieval, processing, quality control, normalization, dimensionality reduction, clustering, differential expression, and functional enrichment analysis — supported by appropriate visualizations.

## Dataset Selection

You must select an **scRNA-seq dataset** for analysis. Dataset Requirements:

1. At least **two experimental conditions** (e.g., cancer vs. normal, treated vs. untreated, or disease vs. healthy). If a dataset has more than two conditions, use a subset.
2. Preferably **human** data; however, **model organism** datasets are acceptable.
3. 10x Genomics scRNA-seq data, FASTQ files are available.

Search [PubMed](https://pubmed.ncbi.nlm.nih.gov/) for your condition of interest ([Example search](https://pubmed.ncbi.nlm.nih.gov/?term=%28%22single-cell+RNA+sequencing%22%5BTitle%2FAbstract%5D+OR+%22scRNA-seq%22%5BTitle%2FAbstract%5D+OR+%22single+cell+transcriptome%22%5BTitle%2FAbstract%5D%29+AND+%28%22disease%22%5BTitle%2FAbstract%5D+OR+%22cancer%22%5BTitle%2FAbstract%5D+OR+%22tumor%22%5BTitle%2FAbstract%5D+OR+%22infection%22%5BTitle%2FAbstract%5D+OR+%22treated%22%5BTitle%2FAbstract%5D+OR+%22control%22%5BTitle%2FAbstract%5D+OR+%22healthy%22%5BTitle%2FAbstract%5D%29+AND+%28%22RNA-seq%22%5BTitle%2FAbstract%5D+OR+%22sequencing%22%5BTitle%2FAbstract%5D%29+AND+%28%22GEO%22%5BTitle%2FAbstract%5D+OR+%22SRA%22%5BTitle%2FAbstract%5D+OR+%22Sequence+Read+Archive%22%5BTitle%2FAbstract%5D+OR+%22FASTQ%22%5BTitle%2FAbstract%5D%29&sort=date)) . See [Single-Cell RNA-seq Resources](https://bios668-2026.netlify.app/slides/03_genomic_resources/02_genomic_resources_xaringan#38) for potential data sources. Note it is almost always advisable to look at the original paper for Gene Expression Omnibus ([GEO](https://www.ncbi.nlm.nih.gov/geo/)) accession numbers. Read the publication associated with your chosen dataset to understand its biological and experimental context.

## Project Organization

1. On your local computer, create a dedicated **project folder** to store all scripts, data, and results.
2. Add a `README.md` file describing each script, its input, and its output.
3. Create a `manuscript.Rmd` file containing your project report written in **R Markdown** format.  
   The report should be knitted as a **Word** and **HTML** dobument.
4. Follow the [IMRaD](https://en.wikipedia.org/wiki/IMRAD) structure (Introduction, Methods, Results, and Discussion).
5. Include **BibTeX references** where relevant.
6. Provide supplementary materials containing:
   - Differential expression results
   - Functional enrichment results
7. The main text (excluding references, tables, and figure legends) should not exceed **3,000 words**.

## Reporting

### 1. Introduction / Background

* Summarize the **research question** and **biological context** of the study.

### 2. Methods

1. Retrieve raw **FASTQ** files from GEO/SRA.
2. Process reads using either Cell Ranger or nf-core/scrnaseq  (High Performance Computing).
3. Import processed data into R using Seurat, include metadata (sample, condition, replicate).
4. Filter low-quality cells using total UMIs (nCount), number of detected genes (nFeature), and % mitochondrial reads.
5. Normalize counts (e.g., log-normalization or SCTransform).
6. Identify highly variable genes to capture biological signal while reducing noise.
7. Perform PCA for initial reduction.
8. Use nonlinear embedding (UMAP/t-SNE) for visualization.
9. Construct a nearest-neighbor graph and perform graph-based clustering (e.g., Louvain/Leiden). Explore resolution parameters to control cluster granularity.
10. Identify cluster-specific marker genes using differential expression (e.g., Wilcoxon rank-sum test).
11. Annotate clusters based on canonical markers and/or reference datasets. Merge or refine clusters where biologically appropriate.
12. Within each annotated cell type, perform differential expression analysis.
13. Perform functional enrichment results and compare pathways affected by differentially expressed genes in each cell type.
14. Compare your results with the original publication.

### 3. Results

- Describe your findings, presented by **figures and tables** .

### 4. Discussion / Conclusion
- Discuss how your analysis and findings differ from the original publication.
- Address potential limitations.

### 5. References
- Use BibTeX-style references consistent with the R Markdown bibliography format.

### 6. Computational Component
- Create a GitHub repository and include HPC scripts and R code  necessary to reproduce results.
- Code should be **well-commented** and formatted for readability (use consistent indentation and spacing).

## Submission Instructions

1. Add the GitHub link to your **manuscript file** and push all scripts and data to your **GitHub repository**.  
2. Submit the **knitted HTML manuscript** to **Canvas**.

## Peer Review Process

1. After submission, you will be assigned to **review one peer’s project**.
   - The goal is to learn from others’ analyses.
2. Instructions for peer review:
   - The peer-to-peer assignment will be distributed via **Canvas**.
   - **Clone** your peer’s repository and **knit** their final project document.
   - Evaluate each section (Introduction, Methods, Results, Discussion, etc.) and rate as:
     - **Pass**, **Fail**, or **Marginal**, with brief justification.
3. Submit your assessment via **Canvas** on or before **May 8, 2026**.

## Grading and Deadlines

- The instructor will formally grade all projects, considering peer assessments.  
- **Final course grades** will be entered in the system on or before **May 12, 2026**.

## Summary of Deliverables

1. GitHub repository containing:
   - All analysis scripts, including data download scripts.
   - `README.md` and `manuscript.Rmd`
2. HTML report (`manuscript.html`)
3. Peer review submission



<!--
The purpose of the final project is for you to gain familiarity with the full spectrum of RNA-seq analysis methods, applied to the real life data. Additionally, the project should help solidify your statistical and practical understanding of such methods.

Your goal is to perform an analysis and interpretation of an RNA-seq dataset. Your project should be a complete and thorough analysis of your data, and must include application of methods related to data retrieval, quality control, normalization, expression summaries, batch effect removal, unsupervised (clustering), differential expression analysis, and functional enrichment analysis methods. Use relevant visualization techniques for each analysis step.

You must select an RNA-seq dataset (gene counts matrix) to analyze. Source of processed RNA-seq data: Gene Expression Omnibus https://www.ncbi.nlm.nih.gov/geo/, recount3 https://rna.recount.bio/ and the corresponding R package https://bioconductor.org/packages/recount3/. Read the paper accompanying the chosen dataset.

Prerequisites for a dataset: 

- at least two experimental conditions (e.g., a particular cancer type, environmental exposure, immunologic or neurologic disease, to be compared with a healthy/untreated condition);
- at least five samples per condition;
- human data, but model organism data are also acceptable;

Create a project folder and organize your scripts there. Add README.md describing each script, its input and output. Create a 'manuscript.md' file to write your report in R/Markdown format that can be compiled as an HTML document. Follow the IMRaD format, https://en.wikipedia.org/wiki/IMRAD, when describing your project and results. Insert BibTex references where relevant. Use supplementary material to provide tables with differential expression results, functional enrichment results. The text content should be limited to no more than 3,000 words, references, tables, and figure legends not counted towards word limit. Address the following points:

1. A simple and clear description of the dataset you will be using and the research question you are addressing. This should be written in the form of an **Introduction/Background** section(s).

2. A **Methods** section that includes the following:

- A detailed description of quality assessment measures examined and a results section detailing the results of the quality evaluation;
- A detailed description of preprocessing methods used to process your raw gene counts data.
- Batch effect correction methods. Apply `ComBat` (if batch is known) and try `sva` assuming batches are unknown.
    - Display the data using Principal Components Analysis before-after batch correction (use `sva` if batches are unknown).  
    - Use different hierarchical clustering methods to cluster top 10% of the most highly variable genes before-after batch correction, describe your observations
- Report differentially expressed genes between at least two conditions. Use either `edgeR` or `DESeq2`. Make sure to include all relevant covariates. 
    - Compare the results with those reported in the original study, if relevant
- Describe filtering steps, multiple testing correction methods, and their appropriatedness for the current study
- Display boxplots of top 10 differentially expressed genes between the conditions
- Perform functional enrichment analysis using GSEA and overrepresentation analysis. Use three domains of gene ontologies, and KEGG pathways.
        
3. A **Results** section providing a thorough description of your results. Tables and figures should be numbered and captioned.
4. A **Discussion/Conclusion** section. Either your Introduction or Discussion section should describe how your analysis of the dataset differs from what the authors reported in their published paper.
5. **References**.
6. **Computational component**: code chunks  as well as any data that can't be recreated with the code must be provided to the instructor so it can be tested. Make sure your code is readable (use an LMM to format your code) and commented.

7. Add the link to your manuscript file and push all scripts and files to GitHub. Submit the knitted manuscript HTML to Canvas.

- Following the submission, you will be assigned to grade one of your peer's project. The goal is to learn from the work of others.   
    - The peer-to-peer assignment will be send through Canvas.
    - Clone your peer's repository on your computer and knit the final project document.
    - Learn from the code and critically assess each section of the final project (Introduction, each Methods/Results subsections, etc.).
    - Critically assess each section as "pass", "fail", "marginal", briefly noting the rationale for the assessment.
- Your assessment is due to be submitted through Canvas on or before [To be determined].
- The instructor will formally grade each project, taking your assessment into consideration. 

- Your final project will be graded on or before [To be determined]

- The final grades will be entered in the system on or before [To be determined].
-->