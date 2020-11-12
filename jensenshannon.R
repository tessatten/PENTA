library("viridis")

library("wesanderson")



#cd4
imm_gu <- geneUsage(alphaVDJCD4data$data, "hs.trav", .norm = T, .quant = "NA") # alpha CD4 V gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p1 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD4+ ", alpha, " V gene region")), .leg.title = "JS", .text.size = 1.5) + scale_fill_viridis(option = "D",discrete = FALSE)
p1
ggsave("alphaCD4VJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

imm_gu <- geneUsage(betaVDJCD4data$data, "hs.trbv", .norm = T, .quant = "NA") # beta CD4 V gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p2 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD4+ ", beta, " V gene region")), .leg.title = "JS", .text.size = 1.5)+ scale_fill_viridis(option = "D",discrete = FALSE)
p2
ggsave("betaCD4VJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

imm_gu <- geneUsage(alphaVDJCD4data$data, "hs.traj", .norm = T, .quant = "NA") # alpha CD4 J gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p3 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD4+ ", alpha, " J gene region")), .leg.title = "JS", .text.size = 1.5)+ scale_fill_viridis(option = "C",discrete = FALSE)
p3
ggsave("alphaCD4JJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

imm_gu <- geneUsage(betaVDJCD4data$data, "hs.trbj", .norm = T, .quant = "NA") # beta CD4 J gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p4 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD4+ ", beta, " J gene region")), .leg.title = "JS", .text.size = 1.5)+ scale_fill_viridis(option = "C",discrete = FALSE)
p4
ggsave("betaCD4JJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

p1 + p3+ p2 + p4 +
  plot_layout(guides = 'collect')


ggsave("CD4JensenShannonNoCount.pdf", width = 38, height = 30, units = c('cm'))

#########################################
#CD8
imm_gu <- geneUsage(alphaVDJCD8data$data, "hs.trav", .norm = T, .quant = "NA") # alpha CD8 V gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p1 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD8+ ", alpha, " V gene region")), .leg.title = "JS", .text.size = 1.5) + scale_fill_viridis(option = "D",discrete = FALSE)
p1
ggsave("alphaCD8VJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

imm_gu <- geneUsage(betaVDJCD8data$data, "hs.trbv", .norm = T, .quant = "NA") # beta CD8 V gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p1 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD8+ ", beta, " V gene region")), .leg.title = "JS", .text.size = 1.5) + scale_fill_viridis(option = "D",discrete = FALSE)
p1
ggsave("betaCD8VJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

imm_gu <- geneUsage(alphaVDJCD8data$data, "hs.traj", .norm = T, .quant = "NA") # alpha CD8 J gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p1 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD8+ ", alpha, " J gene region")), .leg.title = "JS", .text.size = 1.5)+ scale_fill_viridis(option = "C",discrete = FALSE)
p1
ggsave("alphaCD8JJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

imm_gu <- geneUsage(betaVDJCD8data$data, "hs.trbj", .norm = T, .quant = "NA") # beta CD8 J gene
imm_gu_js <- geneUsageAnalysis(imm_gu, .method = "js", .verbose = F)
p1 <- vis(imm_gu_js, .title = expression(paste("Gene usage JS-divergence: CD8+ ", beta, " J gene region")), .leg.title = "JS", .text.size = 1.5)+ scale_fill_viridis(option = "C",discrete = FALSE)
p1
ggsave("betaCD8JJensenShannonNoCount.pdf", width = 25, height = 15, units = c('cm'))

Relative abundance by clonotype size (CD4+ alpha)
Group; Week
Relative abundance of sample (%)
Clonotype size category

Relative abundance on or off ART (CD4+ alpha)
ART
Relative abundance of sample (%)
Clonotype size category

V gene usage on or off ART (CD8+ alpha)
ART
V gene segment
Usage (proportion of clonotypes)

V gene usage on or off ART (CD8+ beta)
ART
V gene segment
Usage (proportion of clonotypes)


