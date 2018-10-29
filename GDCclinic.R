#' @title Retrieve multiple tissue types not from the same patients.
#' @description
#'   TCGAquery_SampleTypes for a given list of samples and types,
#'    return the union of samples that are from theses type.
#' @param barcode is a list of samples as TCGA barcodes
#' @param typesample a character vector indicating tissue type to query.
#' Example:
#' \tabular{ll}{
#'TP \tab   PRIMARY SOLID TUMOR \cr
#'TR \tab   RECURRENT SOLID TUMOR \cr
#'TB \tab   Primary Blood Derived Cancer-Peripheral Blood \cr
#'TRBM \tab Recurrent Blood Derived Cancer-Bone Marrow \cr
#'TAP \tab  Additional-New Primary \cr
#'TM \tab   Metastatic \cr
#'TAM \tab  Additional Metastatic \cr
#'THOC \tab Human Tumor Original Cells \cr
#'TBM \tab  Primary Blood Derived Cancer-Bone Marrow \cr
#'NB \tab   Blood Derived Normal \cr
#'NT \tab   Solid Tissue Normal \cr
#'NBC \tab  Buccal Cell Normal \cr
#'NEBV \tab EBV Immortalized Normal \cr
#'NBM \tab  Bone Marrow Normal \cr
#'}
barcode <- c("TCGA-B0-4698-01Z-00-DX1","TCGA-CZ-4863-02Z-00-DX1")
gourp1 <- TCGAquery_SampleTypes(barcode,"TR")
group2 <- TCGAquery_SampleTypes(barcode,c("TR","TP")) # you can select the right group of persons

# do not run the below source codes
TCGAquery_SampleTypes <- function(barcode,typesample)
  

  
#' @title Retrieve multiple tissue types from the same patients.
#' @description
#'   TCGAquery_MatchedCoupledSampleTypes
#' @param barcode barcode
#' @param typesample typesample
TCGAquery_MatchedCoupledSampleTypes(c("TCGA-B0-4698-01Z-00-DX1","TCGA-B0-4698-02Z-00-DX1"),c("TP","TR"))


#' @title Get GDC clinical data
#' @description
#' GDCquery_clinic will download all clinical information from the API
#' as the one with using the button from each project
#' @param project A valid project (see list with getGDCprojects()$project_id)]
#' @param type A valid type. Options "clinical", "Biospecimen"  (see list with getGDCprojects()$project_id)]
#' @param save.csv Write clinical information into a csv document
clin <- GDCquery_clinic("TCGA-OV", type = "clinical", save.csv = TRUE)
clin <- GDCquery_clinic("TCGA-OV", type = "biospecimen", save.csv = TRUE)
library(readr)
TCGA_OV_clinical <- read_csv("TCGA-OV_clinical.csv")
# do not run the below source codes
GDCquery_clinic <- function(project, type = "clinical", save.csv = FALSE)

#' @title Parsing clinical xml files
#' @description
#' This function receives the query argument and parses the clinical xml files
#' based on the desired information
#' @param query Result from GDCquery, with data.category set to Clinical
#' @param clinical.info Which information should be retrieved.
#' Options Clinical: drug, admin, follow_up,radiation, patient, stage_event or new_tumor_event
#' Options Biospecimen: protocol, admin, aliquot, analyte, bio_patient, sample, portion, slide
#' @param directory Directory/Folder where the data was downloaded. Default: GDCdata
clinic_query <- GDCquery(project = "TCGA-OV", data.category = "Clinical")
clinic_query_download <- GDCdownload(clinic_query)
OV_clinical_patient <- GDCprepare_clinic(query,"patient")
# do not run the below source codes
GDCprepare_clinic <- function(query, clinical.info, directory = "GDCdata")
  
  
#' @title Retrieve table with TCGA molecular subtypes
#' @description
#'   PanCancerAtlas_subtypes is a curated table with molecular subtypes for 24 TCGA cancer types
molecular.subtypes <- PanCancerAtlas_subtypes()
TCGA_MolecularSubtype("TCGA-60-2721-01A-01R-0851-07")
# do not run the below source codes
TCGAquery_subtype <- function(tumor)
  
  
#' @title Filters TCGA barcodes according to purity parameters
#' @description
#'   TCGAtumor_purity Filters TCGA samples using 5 estimates from 5 methods as thresholds.
#' @param barcodes is a vector of TCGA barcodes
#' @param estimate uses gene expression profiles of 141 immune genes and 141 stromal genes
#' @param absolute which uses somatic copy-number data (estimations were available for only 11 cancer types)
#' @param lump (leukocytes unmethylation for purity), which averages 44 non-methylated immune-specific CpG sites
#' @param ihc as estimated by image analysis of haematoxylin and eosin stain slides produced by the Nationwide Childrens Hospital Biospecimen Core Resource
#' @param cpe CPE is a derived consensus measurement as the median purity level after normalizing levels from all methods to give them equal means and s.ds
pam50 <- TCGAtumor_purity("TCGA-60-2721-01A-01R-0851-07",
                          estimate = 0.6,
                                                     absolute = 0.6,
                                                     ihc = 0.8,
                                                     lump = 0.8,
                                                     cpe = 0.7)
