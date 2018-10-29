#' @title Prepare GDC data
#' @description
#'   Reads the data downloaded and prepare it into an R object
#' @param query A query for GDCquery function
#' @param save Save result as RData object?
#' @param save.filename Name of the file to be save if empty an automatic will be created
#' @param directory Directory/Folder where the data was downloaded. Default: GDCdata
#' @param summarizedExperiment Create a summarizedExperiment? Default TRUE (if possible)
#' @param mutant_variant_classification List of mutant_variant_classification that will be
#' consider a sample mutant or not. Default: "Frame_Shift_Del", "Frame_Shift_Ins",
#' "Missense_Mutation", "Nonsense_Mutation", "Splice_Site", "In_Frame_Del",
#' "In_Frame_Ins", "Translation_Start_Site", "Nonstop_Mutation"
GDCdownload(query, method = "api", directory = "cnv")
GDCprepare(query, directory = "cnv")

# do not run the below source codes
GDCprepare <- function(query,
                       save = FALSE,
                       save.filename,
                       directory = "GDCdata",
                       summarizedExperiment = TRUE,
                       remove.files.prepared = FALSE,
                       add.gistic2.mut = NULL,
                       mut.pipeline = "mutect2",
                       mutant_variant_classification = c("Frame_Shift_Del",
                                                         "Frame_Shift_Ins",
                                                         "Missense_Mutation",
                                                         "Nonsense_Mutation",
                                                         "Splice_Site",
                                                         "In_Frame_Del",
                                                         "In_Frame_Ins",
                                                         "Translation_Start_Site",
                                                         "Nonstop_Mutation"))
