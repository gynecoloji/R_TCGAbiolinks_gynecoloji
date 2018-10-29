source("http://bioconductor.org/biocLite.R")
devtools::install_github(repo = "BioinformaticsFMRP/TCGAbiolinks")
library(TCGAbiolinks)
TCGAbiolinks:::getGDCprojects()$project_id # a list of valid project
TCGAbiolinks:::getProjectSummary(project = "TCGA-OV") # a data.category in a valid project
#' @param data.type A data type to filter the files to download
#' @param sample.type A sample type to filter the files to download
#' @param barcode A list of barcodes to filter the files to download
#' @param legacy Search in the legacy repository
#' @param file.type To be used in the legacy database for some platforms
query <- GDCquery(project = "TCGA-OV", data.category = "Copy Number Variation", data.type = "Copy Number Segment")
getResults(query)  # 可以显示QUERY中分类


#' @title Query gene counts of TCGA and GTEx data from the Recount2 project
#' @description
#'   TCGArecount2_query queries and downloads data produced by the Recount2 project. User can specify which project and which tissue to query
#' @param project is a string denoting which project the user wants. Options are "tcga" and "gtex"
#' @param tissue a vector of tissue(s) to download. Options are "adipose tissue", "adrenal", "gland", "bladder","blood", "blood vessel", "bone marrow", "brain", "breast","cervix uteri", "colon", "esophagus", "fallopian tube","heart", "kidney", "liver", "lung", "muscle", "nerve", "ovary","pancreas", "pituitary", "prostate", "salivary", "gland", "skin", "small intestine", "spleen", "stomach", "testis", "thyroid", "uterus", "vagina"
#' @export
brain.rec <- TCGAquery_recount2(project = "gtex", tissue = "brain")


#' @title Retrieve open access maf files from GDC server
#' @description
#'   GDCquery_Maf uses the following guide to download maf files
#'   https://gdc-docs.nci.nih.gov/Data/Release_Notes/Data_Release_Notes/
#' @param pipelines Four separate variant calling pipelines are implemented for GDC data harmonization.
#' Options: muse, varscan2, somaticsniper, mutect2. For more information:
#' https://gdc-docs.nci.nih.gov/Data/Bioinformatics_Pipelines/DNA_Seq_Variant_Calling_Pipeline/
#' @param tumor a valid tumor
#' @param save.csv Write maf file into a csv document
#' @param directory Directory/Folder where the data will downloaded. Default: GDCdata
acc.muse.maf <- GDCquery_Maf("ACC", pipelines = "muse")
# 不要跑下面代码，源代码如下
GDCquery_Maf <- function(tumor,
save.csv = FALSE,
directory = "GDCdata",
pipelines = NULL){
  
  if(is.null(pipelines)) stop("Please select the pipeline argument (muse, varscan2, somaticsniper, mutect2)")
  if(grepl("varscan",pipelines, ignore.case = TRUE)) {
    workflow.type <- "VarScan2 Variant Aggregation and Masking"
  } else if(pipelines == "muse") {
    workflow.type <- "MuSE Variant Aggregation and Masking"
  } else if(pipelines == "somaticsniper") {
    workflow.type <- "SomaticSniper Variant Aggregation and Masking"
  } else if(grepl("mutect",pipelines, ignore.case = TRUE)) {
    workflow.type <-  "MuTect2 Variant Aggregation and Masking"
  } else {
    stop("Please select the pipeline argument (muse, varscan2, somaticsniper, mutect2)")
  }
  