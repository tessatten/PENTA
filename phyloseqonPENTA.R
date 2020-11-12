library("ape")
library("ggplot2")
library("plyr")
library("scales")
library("vegan")
library("knitr")
library("dplyr")
library("praise")
library("tidyverse")
library("phyloseq")
library("Bios2cor")
library("grid")
library("ggpubr")

#data needs to be a  a matrix
CD4_alpha_otu_data_table <- read_csv(file = "CD4_alpha_otu_table_all_noNA.csv") #import otu table
#otu_data_table <- read_csv(file = "CVG_otutable_foranosim.csv") #import otu table
CD4_alpha_otu_data_matrix <- data.matrix(CD4_alpha_otu_data_table) #make the otu table into a matrix (it has to be a matrix)
rownames(CD4_alpha_otu_data_matrix) <- CD4_alpha_otu_data_table$CDR3_AA_sequence #relabel the column names at the OTU numbers
CD4_alpha_otu_data_matrix <- CD4_alpha_otu_data_matrix[,-1] #remove null column

CD4_alpha_otu_table <- otu_table(CD4_alpha_otu_data_matrix, taxa_are_rows = T) #turn OTU table into a phyloseq object

#sample_data_table <- read.csv(file = "CVG_metadata_JULY.csv") #import metadata for samples (all samples)
sample_data_table <- read.csv(file = "pentaFactSheet.csv") #import metadata for samples (samples that worked)


sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Chain=="a"))
sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Cell.type=="CD4"))

sample_matrix <- as.matrix(sample_data_table) #make it a matrix

rownames(sample_matrix) <- sample_data_table$SampleID #change column names, 
#sample_matrix <- sample_matrix[,-1]  #remove null column
sample_matrix <- as.data.frame(sample_matrix) #make it a data frame again
#sam_data is depreciated so switched to sample_data
#required a data frame so switched it back to a data frame


CD4_alpha_UCB_sample_table <- sample_data(sample_matrix) #import to phyloseq

tax_data_table <- read.csv(file = "CD4_alpha_tax_table.csv") #import taxa table

tax_matrix <- as.matrix(tax_data_table) #make the taxa table into a matrix (it has to be a matrix)
rownames(tax_matrix) <- rownames(CD4_alpha_otu_table)

class(tax_matrix)
CD4_alpha_tax_table <- tax_table(tax_matrix)
head(tax_matrix)

#phyloseq_Tcell_alpha <- merge_phyloseq(UCB_otu_table, UCB_sample_table) #merge phyloseq objects
phyloseq_CD4_alpha <- merge_phyloseq(CD4_alpha_otu_table, CD4_alpha_UCB_sample_table, CD4_alpha_tax_table) #merge phyloseq objects
#sample_names(UCB_alpha_otu_table)
#sample_names(UCB_sample_table)

################################################################3
###### cd4 beta

#data needs to be a  a matrix
CD4_beta_otu_data_table <- read_csv(file = "CD4_beta_otu_table_all_noNA.csv") #import otu table
#otu_data_table <- read_csv(file = "CVG_otutable_foranosim.csv") #import otu table
CD4_beta_otu_data_matrix <- data.matrix(CD4_beta_otu_data_table) #make the otu table into a matrix (it has to be a matrix)
rownames(CD4_beta_otu_data_matrix) <- CD4_beta_otu_data_table$CDR3_AA_sequence #relabel the column names at the OTU numbers
CD4_beta_otu_data_matrix <- CD4_beta_otu_data_matrix[,-1] #remove null column

CD4_beta_otu_table <- otu_table(CD4_beta_otu_data_matrix, taxa_are_rows = T) #turn OTU table into a phyloseq object

#sample_data_table <- read.csv(file = "CVG_metadata_JULY.csv") #import metadata for samples (all samples)
sample_data_table <- read.csv(file = "pentaFactSheet.csv") #import metadata for samples (samples that worked)


sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Chain=="b"))
sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Cell.type=="CD4"))

sample_matrix <- as.matrix(sample_data_table) #make it a matrix

rownames(sample_matrix) <- sample_data_table$SampleID #change column names, 
#sample_matrix <- sample_matrix[,-1]  #remove null column
sample_matrix <- as.data.frame(sample_matrix) #make it a data frame again
#sam_data is depreciated so switched to sample_data
#required a data frame so switched it back to a data frame


CD4_beta_UCB_sample_table <- sample_data(sample_matrix) #import to phyloseq


#phyloseq_Tcell_beta <- merge_phyloseq(UCB_otu_table, UCB_sample_table) #merge phyloseq objects
phyloseq_CD4_beta <- merge_phyloseq(CD4_beta_otu_table, CD4_beta_UCB_sample_table) #merge phyloseq objects
#sample_names(CD4_beta_otu_table)
#sample_names(CD4_beta_UCB_sample_table)

#############################

#data needs to be a  a matrix
CD8_alpha_otu_data_table <- read_csv(file = "CD8_alpha_otu_table_all_noNA.csv") #import otu table
#otu_data_table <- read_csv(file = "CVG_otutable_foranosim.csv") #import otu table
CD8_alpha_otu_data_matrix <- data.matrix(CD8_alpha_otu_data_table) #make the otu table into a matrix (it has to be a matrix)
rownames(CD8_alpha_otu_data_matrix) <- CD8_alpha_otu_data_table$CDR3_AA_sequence #relabel the column names at the OTU numbers
CD8_alpha_otu_data_matrix <- CD8_alpha_otu_data_matrix[,-1] #remove null column

CD8_alpha_otu_table <- otu_table(CD8_alpha_otu_data_matrix, taxa_are_rows = T) #turn OTU table into a phyloseq object

#sample_data_table <- read.csv(file = "CVG_metadata_JULY.csv") #import metadata for samples (all samples)
sample_data_table <- read.csv(file = "pentaFactSheet.csv") #import metadata for samples (samples that worked)


sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Chain=="a"))
sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Cell.type=="CD8"))

sample_matrix <- as.matrix(sample_data_table) #make it a matrix

rownames(sample_matrix) <- sample_data_table$SampleID #change column names, 
#sample_matrix <- sample_matrix[,-1]  #remove null column
sample_matrix <- as.data.frame(sample_matrix) #make it a data frame again
#sam_data is depreciated so switched to sample_data
#required a data frame so switched it back to a data frame


CD8_alpha_UCB_sample_table <- sample_data(sample_matrix) #import to phyloseq


#phyloseq_Tcell_alpha <- merge_phyloseq(UCB_otu_table, UCB_sample_table) #merge phyloseq objects
phyloseq_CD8_alpha <- merge_phyloseq(CD8_alpha_otu_table, CD8_alpha_UCB_sample_table) #merge phyloseq objects
#sample_names(UCB_alpha_otu_table)
#sample_names(UCB_sample_table)

################################################################3

################################################################3
###### CD8 beta

#data needs to be a  a matrix
CD8_beta_otu_data_table <- read_csv(file = "CD8_beta_otu_table_all_noNA.csv") #import otu table
#otu_data_table <- read_csv(file = "CVG_otutable_foranosim.csv") #import otu table
CD8_beta_otu_data_matrix <- data.matrix(CD8_beta_otu_data_table) #make the otu table into a matrix (it has to be a matrix)
rownames(CD8_beta_otu_data_matrix) <- CD8_beta_otu_data_table$CDR3_AA_sequence #relabel the column names at the OTU numbers
CD8_beta_otu_data_matrix <- CD8_beta_otu_data_matrix[,-1] #remove null column

CD8_beta_otu_table <- otu_table(CD8_beta_otu_data_matrix, taxa_are_rows = T) #turn OTU table into a phyloseq object

#sample_data_table <- read.csv(file = "CVG_metadata_JULY.csv") #import metadata for samples (all samples)
sample_data_table <- read.csv(file = "pentaFactSheet.csv") #import metadata for samples (samples that worked)


sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Chain=="b"))
sample_data_table <- subset(sample_data_table, subset=(sample_data_table$Cell.type=="CD8"))

sample_matrix <- as.matrix(sample_data_table) #make it a matrix

rownames(sample_matrix) <- sample_data_table$SampleID #change column names, 
#sample_matrix <- sample_matrix[,-1]  #remove null column
sample_matrix <- as.data.frame(sample_matrix) #make it a data frame again
#sam_data is depreciated so switched to sample_data
#required a data frame so switched it back to a data frame

tax_matrix <- as.matrix(tax_data_table) #make the taxa table into a matrix (it has to be a matrix)
rownames(tax_matrix) <- tax_data_table$OTU #relabel the column names to be the OTU numbers
tax_matrix <- tax_matrix[,-1]  #remove null column

CVG_tax_table <- tax_table(tax_matrix)


CD8_beta_UCB_sample_table <- sample_data(sample_matrix) #import to phyloseq


#phyloseq_Tcell_beta <- merge_phyloseq(UCB_otu_table, UCB_sample_table) #merge phyloseq objects
phyloseq_CD8_beta <- merge_phyloseq(CD8_beta_otu_table, CD8_beta_UCB_sample_table, CVG_tax_table) #merge phyloseq objects
#sample_names(CD8_beta_otu_table)
#sample_names(CD8_beta_UCB_sample_table)

#############################
