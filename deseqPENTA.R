library("phyloseq"); packageVersion("phyloseq")
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")
library("DESeq2")
packageVersion("DESeq2")

#first i want to look at differentail expression of cdr3s during the treatment interruption
#so this analysis will only include pti patients

#as with cvg, i will probs not use any with less than 500 reads


#cd4 alpha
head(sample_data(phyloseq_CD4_alpha)$ART, 25)
PTI_phyloseq_CD4_alpha = subset_samples(phyloseq_CD4_alpha, ART != "NA")
head(sample_data(PTI_phyloseq_CD4_alpha)$ART, 25)
PTI_phyloseq_CD4_alpha

#prune low abundance samples
PTI_phyloseq_CD4_alpha <- prune_samples(sample_sums(PTI_phyloseq_CD4_alpha) > 400, PTI_phyloseq_CD4_alpha)
PTI_phyloseq_CD4_alpha

#here do deseq
diagdds = phyloseq_to_deseq2(PTI_phyloseq_CD4_alpha, ~ ART)
# calculate geometric means prior to estimate size factors
gm_mean = function(x, na.rm=TRUE){
  exp(sum(log(x[x > 0]), na.rm=na.rm) / length(x))
}
geoMeans = apply(counts(diagdds), 1, gm_mean)
diagdds = estimateSizeFactors(diagdds, geoMeans = geoMeans)
diagdds = DESeq(diagdds, fitType="local")

res = results(diagdds)
res = res[order(res$padj, na.last=NA), ]
alpha = 0.9
sigtab = res[(res$padj < alpha), ]


rownames(sigtab)



sigtab = cbind(as(res, "data.frame"), as(tax_table(PTI_phyloseq_CD4_alpha)[rownames(res), ], "matrix"))
head(sigtab)
res
sigtab

posigtab = sigtab[sigtab[, "log2FoldChange"] > 0, ]
posigtab = posigtab[, c("baseMean", "log2FoldChange", "lfcSE", "padj", "Phylum", "Class", "Family", "Genus")]
posigtab

library("ggplot2")
theme_set(theme_bw())
# Genus order
x = tapply(sigtab$log2FoldChange, sigtab$CDR3_seq, function(x) max(x))
x = sort(x, TRUE)
sigtabgen$Genus = factor(as.character(sigtabgen$Genus), levels=names(x))
ggplot(sigtab, aes(y=CDR3_seq, x=log2FoldChange)) + 
  geom_vline(xintercept = 0.0, color = "gray", size = 0.5) +
  geom_point(size=15) + 
  theme(axis.text.x = element_text(angle = -90, hjust = 0, vjust=0.5))+
  theme_bw() + guides(fill=FALSE)+ theme(
    plot.title = element_text(color="black", size=28, face="bold"),
    axis.title.x = element_text(color="black", size=28, face="bold"),
    axis.title.y = element_text(color="black", size=28, face="bold"),
    axis.text=element_text(size=26),
    legend.title = element_text(color = "black", size = 26),
    legend.text = element_text(color = "black", size = 24)
  ) + labs(title = "", x = "Difference in abundance (log2FoldChange)", y = "Genus") +
  scale_color_manual(labels = c("Firmicutes"), values = c("#E77EA1")) 
ggsave("DESeqtest.pdf", width = 37, height = 30, units = c('cm'))